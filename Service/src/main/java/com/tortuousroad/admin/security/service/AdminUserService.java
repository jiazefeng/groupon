package com.tortuousroad.admin.security.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.tortuousroad.common.constant.GlobalConstant;
import com.tortuousroad.framework.util.EncryptionUtil;
import com.tortuousroad.framework.util.image.ImageUtil;
import com.tortuousroad.groupon.deal.constant.DealConstant;
import com.tortuousroad.support.image.entity.ImageInfo;
import com.tortuousroad.support.image.service.ImageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tortuousroad.admin.security.dao.AdminUserDAO;
import com.tortuousroad.admin.security.dao.AdminUserRoleDAO;
import com.tortuousroad.admin.security.entity.AdminUser;
import com.tortuousroad.framework.common.page.PagingResult;
import com.tortuousroad.framework.common.search.Search;
import org.springframework.web.multipart.MultipartFile;

/**
 * AdminUserService
 */
@Service
public class AdminUserService {
    private static final Logger logger = LoggerFactory.getLogger(AdminUserService.class);
    @Autowired
    private AdminUserDAO adminUserDAO;

    @Autowired
    private AdminUserRoleDAO adminUserRoleDAO;
    @Autowired
    private ImageService imageService;

    /**
     * 根据用户名查询
     *
     * @param username
     * @return
     */
    public AdminUser getUserByUsername(String username) {
        AdminUser adminUser = adminUserDAO.getUserByUsername(username);
        adminUser.setAdminUserRoles(this.adminUserRoleDAO.findByUserId(adminUser.getId()));
        return adminUser;
    }

    /**
     * 分页查询
     *
     * @param search
     * @return
     */
    public PagingResult<AdminUser> findAdminUserForPage(Search search) {
        PagingResult<AdminUser> result = this.adminUserDAO.findPage(search);
        for (AdminUser adminUser : result.getRows()) {
            adminUser.setAdminUserRoles(this.adminUserRoleDAO.findByUserId(adminUser.getId()));
        }
        return result;
    }

    /**
     * 新建
     *
     * @param adminUser
     */
    public void addAdminUser(AdminUser adminUser) {
        adminUser.setCreateTime(new Date());
        adminUser.setUpdateTime(new Date());
        this.adminUserDAO.save(adminUser);
    }

    /**
     * 更新
     *
     * @param adminUser
     */
    public void updateAdminUser(AdminUser adminUser) {
        this.adminUserDAO.update(adminUser);
    }

    /**
     * 删除
     *
     * @param adminUserId
     */
    public void deleteAdminUser(Long adminUserId) {
        this.adminUserDAO.deleteById(adminUserId);
    }

    public List<AdminUser> getAll() {
        return adminUserDAO.getAll();
    }

    /**
     * 注册用户
     *
     * @param adminUser
     * @param zIdCardFile
     * @param fIdCardFile
     */
    public boolean registerAdminUser(AdminUser adminUser, MultipartFile zIdCardFile, MultipartFile fIdCardFile) {
        adminUser.setPassword(EncryptionUtil.MD5(adminUser.getPassword()));
        try {
            byte[] zIdCardBytes = zIdCardFile.isEmpty() ? null : zIdCardFile.getBytes();
            byte[] fIdCardBytes = fIdCardFile.isEmpty() ? null : fIdCardFile.getBytes();
            if (zIdCardBytes != null && zIdCardBytes.length > 0) {
                Long imageId = uploadDealImage(zIdCardBytes);
                if (null == imageId || 0 == imageId) {
                    logger.info("保存商品图片失败!");
                    return false;
                }
                adminUser.setZIdcardUrl(getObjectImageUrl(imageId, DealConstant.PICTURE_MODULE_IDCARD, 1));
            }
            if (fIdCardBytes != null && fIdCardBytes.length > 0) {
                Long imageId = uploadDealImage(fIdCardBytes);
                if (null == imageId || 0 == imageId) {
                    logger.info("保存商品图片失败!");
                    return false;
                }
                adminUser.setFIdcardUrl(getObjectImageUrl(imageId, DealConstant.PICTURE_MODULE_IDCARD, 1));
            }
            adminUser.setCreateTime(new Date());
            adminUser.setUpdateTime(new Date());
            adminUserDAO.save(adminUser);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 上传商品图片
     *
     * @param imgBytes 图片数据
     * @return
     */
    public Long uploadDealImage(byte[] imgBytes) {
        FileOutputStream fos = null;
        long imgId = 0;
        try {
            String sourceFileAbsolutePath = "";// 图片文件绝对路径
            String sourceFileRelativePath = "";// 图片文件相对路径
            ImageInfo image = new ImageInfo();// 将图片信息存入数据库
            imgId = imageService.addImage(image);
            if (imgId > 0) {
                sourceFileAbsolutePath = ImageUtil.getImageSourceFileAbsolutePath(imgId);
                sourceFileRelativePath = ImageUtil.getImageSourceFileRelativePath(imgId);
                File sourceFileDir = new File(sourceFileAbsolutePath).getParentFile();// 将图片写入硬盘
                if (!sourceFileDir.exists()) {// 若图片源文件夹不存在则新建
                    sourceFileDir.mkdirs();
                }
                fos = new FileOutputStream(sourceFileAbsolutePath);
                fos.write(imgBytes);
                fos.flush();
                logger.info("上传商品图片[id=" + imgId + "]到目录：" + sourceFileAbsolutePath);
                ImageUtil.generateImage(DealConstant.PICTURE_MODULE_IDCARD, imgId, sourceFileAbsolutePath);//生成各个尺寸的图片
                HashMap<String, String> imageInfo = ImageUtil.getBaseInfo(sourceFileAbsolutePath);// 完善图片信息
                image.setId(imgId);
                image.setHeight(Integer.valueOf(imageInfo.get("Height")));
                image.setWidth(Integer.valueOf(imageInfo.get("Width")));
                image.setSourcePath(sourceFileRelativePath);
                imageService.updateImage(image);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                }
            }
        }
        return imgId;
    }

    /**
     * 获取图片URL
     *
     * @param imageId           图片ID
     * @param moduleName        模块名称，如：deal
     * @param imageConfigNumber 详见image.properties
     * @return
     */
    protected String getObjectImageUrl(long imageId, String moduleName, int imageConfigNumber) {
        return ImageUtil.getImageUrl(GlobalConstant.IMAGE_DOMAIN + "/images/", imageId, moduleName, imageConfigNumber);
    }
}