package com.raven.form;

import com.raven.model.HoaDon;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import javax.management.StringValueExp;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import com.raven.service.impl.HoaDonImpl11;
import com.raven.service.impl.NhanVienImpl11;
import com.raven.service.impl.SanPhamImpl11;
import com.raven.viewmodel.ChiTietHoaDonVM;
import com.raven.viewmodel.HoaDonViewModel;
import com.raven.viewmodel.MaNhanVienVM;
import com.raven.viewmodel.SanPhamVM2;
import com.raven.service.HoaDonService11;
import com.raven.service.NhanVienService11;

public class Form_BanHang extends javax.swing.JPanel {

    private ArrayList<SanPhamVM2> listSpVMD = new ArrayList<>();
    private HoaDonService11 HDservice = new HoaDonImpl11();
    private DefaultTableModel dtm = new DefaultTableModel();
    private DefaultTableModel dtmHD = new DefaultTableModel();
    private DefaultTableModel dtmHoaDon = new DefaultTableModel();
    DefaultTableModel dtmSearch = new DefaultTableModel();
    DefaultTableModel dtmSearchHD = new DefaultTableModel();
    private DefaultTableModel dtmGH = new DefaultTableModel();
    private DefaultComboBoxModel dcmNV = new DefaultComboBoxModel();
    private SanPhamImpl11 spImpl = new SanPhamImpl11();
    private NhanVienService11 nvsv = new NhanVienImpl11();
    ArrayList<ChiTietHoaDonVM> listCTHD = new ArrayList<>();
    ArrayList<MaNhanVienVM> listNV = new ArrayList<>();
    ArrayList<HoaDonViewModel> listHDVM = new ArrayList<>();

    public Form_BanHang() {
        initComponents();
         
        loadComboBoxMNV();
        loadcbbSapXep();
        loadcbbSapXepHD();
        listSpVMD = spImpl.getListSP();
        listHDVM = HDservice.getListHoaDon();

        loadTable();
    }
    
    private void loadcbbSapXep() {
        cbbSapXep.removeAllItems();
        cbbSapXep.addItem("Sap xep theo ten");
        cbbSapXep.addItem("Sap xep theo ten giam dan");
        cbbSapXep.addItem("Sap xep theo gia giam dan");
        cbbSapXep.addItem("Sap xep theo gia tang dan");
        cbbSapXep.addItem("Sap xep theo namsx tang dan");
        cbbSapXep.addItem("Sap xep theo namsx giam dan");
    }

    private void loadcbbSapXepHD() {
    cbbSapXepHD.removeAllItems();
        cbbSapXepHD.addItem("Sap xep theo ten NV A-->Z");
        cbbSapXepHD.addItem("Sap xep theo ten NV Z-->A");
        cbbSapXepHD.addItem("Sap xep theo gia giam dan");
        cbbSapXepHD.addItem("Sap xep theo gia tang dan");
        cbbSapXepHD.addItem("Sap xep theo trang thai chua thanh toan");
        cbbSapXepHD.addItem("Sap xep theo trang thai da thanh toan");
    }

    private void addTableHoaDon(ArrayList<HoaDon> listhoaDon) {
        dtmHoaDon = (DefaultTableModel) tblHoaDon.getModel();
        dtmHoaDon.setRowCount(0);
        for (HoaDon hoaDon : listhoaDon) {
            dtmHoaDon.addRow(new Object[]{hoaDon.getIdNhanVien(), hoaDon.getIdHTTT(), hoaDon.getIdKhachHang(), hoaDon.getMa(), hoaDon.getTenXe(), hoaDon.getTenNV(), hoaDon.getTenKH(), hoaDon.getNgayTao(), hoaDon.getNgayThanhToan(), hoaDon.getTongTien(), hoaDon.getSoTienGiam(), hoaDon.getTrangThai()});
        }
    }

    private void loadTableGH() {
        DefaultTableModel dtmGH = (DefaultTableModel) tblLuachonsp.getModel();
        dtmGH.setRowCount(0);
        for (ChiTietHoaDonVM x : listCTHD) {
            dtmGH.addRow(new Object[]{
                x.getMa(),
                x.getTen(),
                x.getGia(),
                x.getSoluong()
            });
        }
    }

    private void loadComboBoxMNV() {
        cbbMaNV.removeAllItems();
        listNV = (ArrayList<MaNhanVienVM>) nvsv.getNV();
        for (MaNhanVienVM maNV : listNV) {
            cbbMaNV.addItem(maNV);
        }

    }

    private void loadTable() {
        DefaultTableModel dtm = (DefaultTableModel) tbldanhsachsp.getModel();
        dtm.setRowCount(0);
        for (SanPhamVM2 x : listSpVMD) {
            SanPhamVM2 ct = x;
            dtm.addRow(new Object[]{
                ct.getId(),
                ct.getMa(),
                ct.getTen(),
                ct.getGiaBan(),
                ct.getNamSx(),
                ct.getTrangThai() == 0 ? "Ngung kinh doanh" : "Dang kinh doanh"
            });
        }

    }

    private void loadTableHoaDon() {
//        List<HoaDonViewModel> listHDVM = HDservice.getListHoaDon();
        dtmHD = (DefaultTableModel) tblHoaDon.getModel();
        dtmHD.setRowCount(0);
        for (HoaDonViewModel x : listHDVM) {
            dtmHD.addRow(new Object[]{
                x.getMaNV(),
                x.getTenNV(),
                x.getTenKH(),
                x.getMaHD(),
                x.getMaXe(),
                x.getTenXe(),
                x.getSoLuong(),
                x.getDonGia(),
                x.getTrangThai() == 1 ? "Chua thanh toan" : "Da thanh toan",
                x.getSoTienGiam(),
                x.getThanhTien(),
                x.getKhachCanTra(),
                x.getNgayTaoHoaDon(),
                x.getNgayThanhToan(),
                x.getSdt(),
                x.getDiaChi(),
                x.getGhiChu()
            });
            System.out.println(listHDVM);
        }

    }

    private void showDataTable(List<SanPhamVM2> list) {
        dtm = (DefaultTableModel) tbldanhsachsp.getModel();
        dtm.setRowCount(0);
        for (SanPhamVM2 sp : list) {
            dtm.addRow(sp.toRowData());
        }

    }

    private void fillToTableHoaDon(int index) {
        listSpVMD.removeAll(listSpVMD);
        String baoHiem = "Bao Hiem";
        String lamBien = "Lam Bien";
        HoaDonViewModel hdvm = listHDVM.get(index);
        lbMaHD.setText(hdvm.getMaHD());
        lbTenNV.setText(hdvm.getTenNV());
        cbbMaNV.setSelectedItem(hdvm.getMaNV());
        txtTenKH.setText(hdvm.getTenKH());
        lbMasp.setText(hdvm.getMaXe());
        lbTensp.setText(hdvm.getTenXe());
        lbDonGia.setText(String.valueOf(hdvm.getDonGia()));
        txtSoLuong.setText(Integer.toString(hdvm.getSoLuong()));
        lbTongtienxe.setText(String.valueOf(hdvm.getThanhTien()));
        lbGiaGiam.setText(String.valueOf(hdvm.getSoTienGiam()));
        txtKhachTra.setText(String.valueOf(hdvm.getKhachCanTra()));
        if (hdvm.getTrangThai() == 1) {
            rdoChoThanhToan.setSelected(true);
        } else {
            rdoThanhToan.setSelected(true);
        }

        if (cbBaoHiemXe.isSelected()) {
            hdvm.setGhiChu(baoHiem);
        } else if (cbDangKyBien.isSelected()) {
            hdvm.setGhiChu(lamBien);
        } else if (cbBaoHiemXe.isSelected() && cbDangKyBien.isSelected()) {
            hdvm.setGhiChu(baoHiem + lamBien);
        } else {
            hdvm.setGhiChu("");
        }
        txaGhichu.setText(hdvm.getGhiChu());

    }

     
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        txtTimKiem = new javax.swing.JTextField();
        btnSearch = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        tbldanhsachsp = new javax.swing.JTable();
        jButton4 = new javax.swing.JButton();
        cbbSapXep = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();
        jLabel20 = new javax.swing.JLabel();
        jPanel7 = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        tblLuachonsp = new javax.swing.JTable();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jPanel8 = new javax.swing.JPanel();
        jLabel27 = new javax.swing.JLabel();
        jPanel9 = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        tblHoaDon = new javax.swing.JTable();
        txtTimKiemHD = new javax.swing.JTextField();
        btnSearchHD = new javax.swing.JButton();
        btnHienThiHD = new javax.swing.JButton();
        cbbSapXepHD = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        jTabbedPane2 = new javax.swing.JTabbedPane();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel16 = new javax.swing.JLabel();
        txtKhachTra = new javax.swing.JTextField();
        jLabel17 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        txaGhichu = new javax.swing.JTextArea();
        rdoThanhToan = new javax.swing.JRadioButton();
        jLabel23 = new javax.swing.JLabel();
        rdoChoThanhToan = new javax.swing.JRadioButton();
        jLabel22 = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        cbBaoHiemXe = new javax.swing.JCheckBox();
        cbDangKyBien = new javax.swing.JCheckBox();
        lbTongtienxe = new javax.swing.JLabel();
        lbGiaGiam = new javax.swing.JLabel();
        lbTienTraLai = new javax.swing.JLabel();
        cbbMaNV = new javax.swing.JComboBox<MaNhanVienVM>();
        jPanel10 = new javax.swing.JPanel();
        jLabel19 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        jLabel29 = new javax.swing.JLabel();
        jLabel30 = new javax.swing.JLabel();
        txtSoLuong = new javax.swing.JTextField();
        lbMasp = new javax.swing.JLabel();
        lbTensp = new javax.swing.JLabel();
        lbDonGia = new javax.swing.JLabel();
        jLabel31 = new javax.swing.JLabel();
        txtTenKH = new javax.swing.JTextField();
        lbMaHD = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        lbManv = new javax.swing.JLabel();
        lbTenNV = new javax.swing.JLabel();
        jButton6 = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setPreferredSize(new java.awt.Dimension(770, 872));

        jLabel2.setBackground(new java.awt.Color(0, 0, 0));
        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setText("Danh sách sản phẩm");

        jPanel4.setBackground(new java.awt.Color(0, 255, 255));

        btnSearch.setBackground(new java.awt.Color(255, 255, 153));
        btnSearch.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Search.png"))); // NOI18N
        btnSearch.setText("Tim kiem");
        btnSearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearchActionPerformed(evt);
            }
        });

        tbldanhsachsp.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Ma san pham", "Ten san pham", "Gia Ban", "Nam SX", "Trang Thai"
            }
        ));
        tbldanhsachsp.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbldanhsachspMouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(tbldanhsachsp);

        jButton4.setBackground(new java.awt.Color(255, 255, 153));
        jButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Add to basket.png"))); // NOI18N
        jButton4.setText("Thêm sản phẩm");

        cbbSapXep.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cbbSapXep.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cbbSapXepItemStateChanged(evt);
            }
        });

        jButton1.setText("Hiển thị");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 700, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(txtTimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnSearch)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cbbSapXep, javax.swing.GroupLayout.PREFERRED_SIZE, 168, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButton1)
                        .addGap(35, 35, 35)
                        .addComponent(jButton4)
                        .addGap(26, 26, 26))))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtTimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(btnSearch)
                        .addComponent(cbbSapXep, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jButton4)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 350, Short.MAX_VALUE)
                .addContainerGap())
        );

        jLabel20.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel20.setText("Sản phẩm đã chọn");

        jPanel7.setBackground(new java.awt.Color(0, 255, 255));
        jPanel7.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        tblLuachonsp.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã sản phẩm", "Tên sản phẩm", "Đơn giá", "Số lượng"
            }
        ));
        tblLuachonsp.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblLuachonspMouseClicked(evt);
            }
        });
        jScrollPane4.setViewportView(tblLuachonsp);

        jButton2.setBackground(new java.awt.Color(255, 255, 153));
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Notes.png"))); // NOI18N
        jButton2.setText("Tạo hóa đơn");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setBackground(new java.awt.Color(255, 255, 153));
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Refresh.png"))); // NOI18N
        jButton3.setText("Làm mới");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton5.setBackground(new java.awt.Color(255, 255, 153));
        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Delete.png"))); // NOI18N
        jButton5.setText("Xóa khỏi lựa chọn");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jScrollPane4)
                        .addContainerGap())
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jButton5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton3)
                        .addGap(13, 13, 13))))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 163, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton5)
                    .addComponent(jButton2)
                    .addComponent(jButton3))
                .addGap(76, 76, 76))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel7, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel20)
                            .addComponent(jLabel2))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel20)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, 238, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        jTabbedPane1.addTab("Quản lý bán hàng", jPanel1);

        jPanel8.setBackground(new java.awt.Color(255, 255, 255));

        jLabel27.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel27.setText("Danh sach hoa don");

        jPanel9.setBackground(new java.awt.Color(0, 255, 255));
        jPanel9.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        tblHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Ma NV", "Ten NV", "Ten KH", "Ma HD", "Ma SP", "Ten Xe", "So luong", "Don Gia", "Trang Thai"
            }
        ));
        tblHoaDon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblHoaDonMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(tblHoaDon);

        javax.swing.GroupLayout jPanel9Layout = new javax.swing.GroupLayout(jPanel9);
        jPanel9.setLayout(jPanel9Layout);
        jPanel9Layout.setHorizontalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 691, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel9Layout.setVerticalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 382, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(174, Short.MAX_VALUE))
        );

        btnSearchHD.setBackground(new java.awt.Color(255, 255, 153));
        btnSearchHD.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Search.png"))); // NOI18N
        btnSearchHD.setText("Tim kiem");
        btnSearchHD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearchHDActionPerformed(evt);
            }
        });

        btnHienThiHD.setBackground(new java.awt.Color(255, 255, 153));
        btnHienThiHD.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/List.png"))); // NOI18N
        btnHienThiHD.setText("Hien Thi");
        btnHienThiHD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnHienThiHDActionPerformed(evt);
            }
        });

        cbbSapXepHD.setBackground(new java.awt.Color(255, 255, 153));
        cbbSapXepHD.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cbbSapXepHD.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cbbSapXepHDItemStateChanged(evt);
            }
        });
        cbbSapXepHD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbbSapXepHDActionPerformed(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel6.setText("Trang Thai");

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addGap(11, 11, 11)
                        .addComponent(jPanel9, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addGap(14, 14, 14)
                        .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel8Layout.createSequentialGroup()
                                .addComponent(txtTimKiemHD, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(btnSearchHD)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel6)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(cbbSapXepHD, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addGap(18, 18, 18)
                                .addComponent(btnHienThiHD)
                                .addGap(13, 13, 13))
                            .addComponent(jLabel27))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtTimKiemHD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSearchHD)
                    .addComponent(btnHienThiHD)
                    .addComponent(cbbSapXepHD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel27)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel9, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(70, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Trạng thái hóa đơn", jPanel8);

        jPanel3.setBackground(new java.awt.Color(0, 255, 255));

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel3.setText("Tên nhân viên:");

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel4.setText("Mã hóa đơn");

        jPanel5.setBackground(new java.awt.Color(0, 255, 255));

        jLabel7.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel7.setText("Tổng tiền xe:");

        jLabel9.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel9.setText("Giảm giá");

        jLabel11.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel11.setText("Thuế VAT:");

        jLabel12.setBackground(new java.awt.Color(255, 0, 51));
        jLabel12.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(255, 0, 0));
        jLabel12.setText("VAT 10%");

        jLabel13.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel13.setText("Hình thức thanh toán:");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Online", "Item 2", "Item 3", "Item 4" }));

        jLabel16.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel16.setText("Khách trả:");

        jLabel17.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel17.setText("Tiền trả lại:");

        txaGhichu.setColumns(20);
        txaGhichu.setRows(5);
        jScrollPane1.setViewportView(txaGhichu);

        rdoThanhToan.setBackground(new java.awt.Color(0, 255, 255));
        buttonGroup1.add(rdoThanhToan);
        rdoThanhToan.setText("Thanh Toan");
        rdoThanhToan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                rdoThanhToanActionPerformed(evt);
            }
        });

        jLabel23.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel23.setText("Trạng thái:");

        rdoChoThanhToan.setBackground(new java.awt.Color(0, 255, 255));
        buttonGroup1.add(rdoChoThanhToan);
        rdoChoThanhToan.setText("Cho Thanh toan");
        rdoChoThanhToan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                rdoChoThanhToanActionPerformed(evt);
            }
        });

        jLabel22.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel22.setText("Ghi chu:");

        jLabel26.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel26.setText("Dịch vụ:");

        cbBaoHiemXe.setBackground(new java.awt.Color(0, 255, 255));
        cbBaoHiemXe.setText("Bao hiem xe");

        cbDangKyBien.setBackground(new java.awt.Color(0, 255, 255));
        cbDangKyBien.setText("Dang ky bien so");
        cbDangKyBien.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbDangKyBienActionPerformed(evt);
            }
        });

        lbTongtienxe.setText("jLabel32");

        lbGiaGiam.setText("jLabel33");

        lbTienTraLai.setText("jLabel35");

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel13)
                            .addComponent(jLabel11))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel12)
                            .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 157, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtKhachTra, javax.swing.GroupLayout.PREFERRED_SIZE, 157, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel5Layout.createSequentialGroup()
                                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel16)
                                    .addComponent(jLabel17))
                                .addGap(75, 75, 75)
                                .addComponent(lbTienTraLai))
                            .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel5Layout.createSequentialGroup()
                                    .addComponent(jLabel7)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lbTongtienxe))
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel5Layout.createSequentialGroup()
                                    .addComponent(jLabel9)
                                    .addGap(84, 84, 84)
                                    .addComponent(lbGiaGiam)))
                            .addGroup(jPanel5Layout.createSequentialGroup()
                                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel26, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel23)
                                    .addComponent(jLabel22))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addGroup(jPanel5Layout.createSequentialGroup()
                                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(cbBaoHiemXe, javax.swing.GroupLayout.PREFERRED_SIZE, 107, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addComponent(rdoChoThanhToan))
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(rdoThanhToan)
                                            .addComponent(cbDangKyBien)))
                                    .addComponent(jScrollPane1))))
                        .addContainerGap(28, Short.MAX_VALUE))))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(lbTongtienxe))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbGiaGiam)
                    .addComponent(jLabel9))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel11)
                    .addComponent(jLabel12))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel13))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel16)
                    .addComponent(txtKhachTra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbTienTraLai)
                    .addComponent(jLabel17))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel23)
                    .addComponent(rdoChoThanhToan, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(rdoThanhToan, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel26)
                    .addComponent(cbBaoHiemXe)
                    .addComponent(cbDangKyBien))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel22)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(191, 191, 191))
        );

        cbbMaNV.setModel(new javax.swing.DefaultComboBoxModel<MaNhanVienVM>());
        cbbMaNV.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cbbMaNVItemStateChanged(evt);
            }
        });
        cbbMaNV.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbbMaNVActionPerformed(evt);
            }
        });

        jPanel10.setBackground(new java.awt.Color(0, 255, 255));

        jLabel19.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel19.setText("Mã sản phẩm:");

        jLabel25.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel25.setText("Tên sản phẩm:");

        jLabel29.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel29.setText("Đơn giá:");

        jLabel30.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel30.setText("Số lượng:");

        lbMasp.setText("jLabel6");

        lbTensp.setText("jLabel21");

        lbDonGia.setText("jLabel31");

        jLabel31.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel31.setText("Tên khách hàng:");

        javax.swing.GroupLayout jPanel10Layout = new javax.swing.GroupLayout(jPanel10);
        jPanel10.setLayout(jPanel10Layout);
        jPanel10Layout.setHorizontalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel19)
                            .addComponent(jLabel31))
                        .addGap(28, 28, 28)
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtTenKH, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lbMasp)
                            .addComponent(lbTensp))
                        .addGap(0, 35, Short.MAX_VALUE))
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel29)
                            .addComponent(jLabel25)
                            .addComponent(jLabel30))
                        .addGap(39, 39, 39)
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lbDonGia)
                            .addComponent(txtSoLuong, javax.swing.GroupLayout.PREFERRED_SIZE, 163, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel10Layout.setVerticalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel31)
                    .addComponent(txtTenKH, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel19)
                    .addComponent(lbMasp))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel25)
                    .addComponent(lbTensp))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel29)
                    .addComponent(lbDonGia))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtSoLuong, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel30))
                .addContainerGap())
        );

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setText("Mã nhân viên:");

        lbTenNV.setText("jLabel6");

        jButton6.setBackground(new java.awt.Color(255, 255, 153));
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Edit.png"))); // NOI18N
        jButton6.setText("Cập nhật");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addGap(445, 445, 445)
                                .addComponent(lbManv))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel5))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(cbbMaNV, javax.swing.GroupLayout.PREFERRED_SIZE, 189, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lbTenNV)))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                                .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(lbMaHD, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(141, 141, 141)
                        .addComponent(jButton6)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(lbTenNV))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(cbbMaNV, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbManv)
                    .addComponent(jLabel4))
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(lbMaHD, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(143, 143, 143))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, 323, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(39, 39, 39)
                .addComponent(jButton6)
                .addGap(204, 204, 204))
        );

        jTabbedPane2.addTab("Hoa don", jPanel3);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 731, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTabbedPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 361, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jTabbedPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                .addContainerGap())
            .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 762, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearchActionPerformed

        //        listSpVMD.removeAll(listSpVMD);
        listSpVMD.clear();
        String ma = txtTimKiem.getText();
        listSpVMD = spImpl.getOneSP(ma);
        JOptionPane.showMessageDialog(this, "Tim kiem thanh cong");
        dtmSearch = (DefaultTableModel) tbldanhsachsp.getModel();
        dtmSearch.setRowCount(0);
        for (SanPhamVM2 ct : listSpVMD) {
            dtmSearch.addRow(new Object[]{
                ct.getId(),
                ct.getMa(),
                ct.getTen(),
                ct.getGiaBan(),
                ct.getNamSx(),
                ct.getTrangThai() == 1 ? "Ngung kinh doanh" : "Dang kinh doanh"
            });
        }
    }//GEN-LAST:event_btnSearchActionPerformed

    private void tbldanhsachspMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbldanhsachspMouseClicked
        ChiTietHoaDonVM chiTietHoaDonVM = new ChiTietHoaDonVM();
        int rowCTHD = tbldanhsachsp.getSelectedRow();
        int soLuong = 1;

        if (tbldanhsachsp.getValueAt(rowCTHD, 5).equals("Dang kinh doanh")) {
            chiTietHoaDonVM.setMa(tbldanhsachsp.getValueAt(rowCTHD, 1).toString());
            chiTietHoaDonVM.setTen(tbldanhsachsp.getValueAt(rowCTHD, 2).toString());
            chiTietHoaDonVM.setGia((BigDecimal) tbldanhsachsp.getValueAt(rowCTHD, 3));
            chiTietHoaDonVM.setSoluong(soLuong);
            listCTHD.add(chiTietHoaDonVM);

        } else {
            JOptionPane.showMessageDialog(this, "Sản phẩm đã ngừng kinh doanh");
        }

        loadTableGH();
    }//GEN-LAST:event_tbldanhsachspMouseClicked

    private void cbbSapXepItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cbbSapXepItemStateChanged
        // TODO add your handling code here:
        String index = (String) cbbSapXep.getSelectedItem();
        System.out.println(index);
        if (index == "Sap xep theo ten") {
            Collections.sort(listSpVMD, new Comparator<SanPhamVM2>() {
                @Override
                public int compare(SanPhamVM2 o1, SanPhamVM2 o2) {
                    return o1.getTen().compareToIgnoreCase(o2.getTen());
                }
            });
            loadTable();
        } else if (index == "Sap xep theo ten giam dan") {
            Collections.sort(listSpVMD, new Comparator<SanPhamVM2>() {
                @Override
                public int compare(SanPhamVM2 o1, SanPhamVM2 o2) {
                    return o2.getTen().compareToIgnoreCase(o1.getTen());
                }
            });
            loadTable();
        } else if (index == "Sap xep theo gia giam dan") {
            Collections.sort(listSpVMD, new Comparator<SanPhamVM2>() {
                @Override
                public int compare(SanPhamVM2 o1, SanPhamVM2 o2) {
                    return o2.getGiaBan().compareTo(o1.getGiaBan());
                }
            });
            loadTable();
        } else if (index == "Sap xep theo gia tang dan") {
            Collections.sort(listSpVMD, new Comparator<SanPhamVM2>() {
                @Override
                public int compare(SanPhamVM2 o1, SanPhamVM2 o2) {
                    return o1.getGiaBan().compareTo(o2.getGiaBan());
                }
            });
            loadTable();
        } else if (index == "Sap xep theo namsx tang dan") {
            Collections.sort(listSpVMD, new Comparator<SanPhamVM2>() {
                @Override
                public int compare(SanPhamVM2 o1, SanPhamVM2 o2) {
                    return Integer.compare(o1.getNamSx(), o2.getNamSx());
                }
            });
            loadTable();
        } else if (index == "Sap xep theo namsx giam dan") {
            Collections.sort(listSpVMD, new Comparator<SanPhamVM2>() {
                @Override
                public int compare(SanPhamVM2 o1, SanPhamVM2 o2) {
                    return Integer.compare(o2.getNamSx(), o1.getNamSx());
                }
            });
            loadTable();
        }
    }//GEN-LAST:event_cbbSapXepItemStateChanged

    private void tblLuachonspMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblLuachonspMouseClicked
        // TODO add your handling code here:

        int index = tblLuachonsp.getSelectedRow();
        lbMasp.setText(String.valueOf(tblLuachonsp.getValueAt(index, 0)));
        lbTensp.setText(String.valueOf(tblLuachonsp.getValueAt(index, 1)));
        lbDonGia.setText(String.valueOf(tblLuachonsp.getValueAt(index, 2)));
    }//GEN-LAST:event_tblLuachonspMouseClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        //        addTableHoaDon(listhoaDon);
//        for (int i = 0; i < tblLuachonsp.getRowCount(); i++) {
//
//            HoaDonViewModel hoaDon = new HoaDonViewModel();
//            String maHD = "HD";
//
//            hoaDon.setMaXe(tblLuachonsp.getValueAt(i, 0).toString());
//            hoaDon.setTenXe(tblLuachonsp.getValueAt(i, 1).toString());
//            hoaDon.setDonGia((BigDecimal) tblLuachonsp.getValueAt(i, 2));
//            hoaDon.setSoLuong((Integer) tblLuachonsp.getValueAt(i, 3));
//            hoaDon.setTrangThai(1);
//            hoaDon.setNgayTaoHoaDon(new Date());
//            for (int j = 1; j <= tblHoaDon.getRowCount(); j++) {
//                if (!(maHD + j).equals(tblHoaDon.getValueAt(j, 3))) {
//                    hoaDon.setMaHD(maHD + j);
//
//                }
//            }
//
//            //            hoaDon.setSoTienGiam(BigDecimal.valueOf(0));
//            HDservice.saveHoaDon(hoaDon);
//            JOptionPane.showMessageDialog(this, "Tao hoa don thanh cong");
//
//        }
//        loadTableHoaDon();
        
         JOptionPane.showMessageDialog(this, "Tao hoa don thanh cong");

    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        listCTHD.clear();
        DefaultTableModel dtmGH = (DefaultTableModel) tblLuachonsp.getModel();
        dtmGH.setRowCount(0);
        dtmGH.setColumnCount(4);

    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        int index = tblLuachonsp.getSelectedRow();
        listCTHD.remove(index);
        loadTableGH();
    }//GEN-LAST:event_jButton5ActionPerformed

    private void tblHoaDonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblHoaDonMouseClicked
        int row = tblHoaDon.getSelectedRow();
        listHDVM = HDservice.getListHoaDon();
        String baoHiem = "Bao Hiem";
        String lamBien = "Lam Bien";
        int index = tblHoaDon.getSelectedRow();
        HoaDonViewModel hdvm = listHDVM.get(index);
        for (int i = 0; i < cbbMaNV.getItemCount(); i++) {
            MaNhanVienVM m = cbbMaNV.getItemAt(i);
            if (m.getMaNV().equalsIgnoreCase(hdvm.getMaNV())) {
                cbbMaNV.setSelectedIndex(i);
            }
        }
        lbMaHD.setText(hdvm.getMaHD());
        txtTenKH.setText(hdvm.getTenKH());
        lbMasp.setText(hdvm.getMaXe());
        lbTensp.setText(hdvm.getTenXe());
        lbDonGia.setText(String.valueOf(hdvm.getDonGia()));
        txtSoLuong.setText(String.valueOf(hdvm.getSoLuong()));
        txtKhachTra.setText(String.valueOf(hdvm.getKhachCanTra()));
        lbTongtienxe.setText(String.valueOf(BigDecimal.valueOf(hdvm.getSoLuong()).multiply(hdvm.getDonGia()).subtract(hdvm.getSoTienGiam())));
        lbGiaGiam.setText(String.valueOf(hdvm.getSoTienGiam()));
        if (hdvm.getTrangThai() == 1) {
            rdoChoThanhToan.setSelected(true);
        } else {
            rdoThanhToan.setSelected(true);
        }

        if (cbBaoHiemXe.isSelected()) {
            hdvm.setGhiChu(baoHiem);
        } else if (cbDangKyBien.isSelected()) {
            hdvm.setGhiChu(lamBien);
        } else if (cbBaoHiemXe.isSelected() && cbDangKyBien.isSelected()) {
            hdvm.setGhiChu(baoHiem + lamBien);
        } else {
            hdvm.setGhiChu("");
        }
        txaGhichu.setText(hdvm.getGhiChu());

        //        lbTongtienxe.setText(String.valueOf(soLuong.multiply(hdvm.getDonGia().subtract(hdvm.getSoTienGiam()))));
        //        int row = tblHoaDon.getSelectedRow();
        //        listHDVM = HDservice.getListHoaDon();
        //        fillToTableHoaDon(row);
    }//GEN-LAST:event_tblHoaDonMouseClicked

    private void btnSearchHDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearchHDActionPerformed
        listHDVM.clear();
        String ma = txtTimKiemHD.getText();
        listHDVM = HDservice.getOneHD(ma);
        JOptionPane.showMessageDialog(this, "Tim kiem thanh cong");
        dtmSearchHD = (DefaultTableModel) tblHoaDon.getModel();
        dtmSearchHD.setRowCount(0);
        for (HoaDonViewModel x : listHDVM) {
            dtmSearchHD.addRow(new Object[]{
                x.getMaNV(),
                x.getTenNV(),
                x.getTenKH(),
                x.getMaHD(),
                x.getMaXe(),
                x.getTenXe(),
                x.getSoLuong(),
                x.getDonGia(),
                x.getTrangThai() == 1 ? "Chua thanh toan" : "Da thanh toan",
                x.getSoTienGiam(),
                x.getThanhTien(),
                x.getKhachCanTra(),
                x.getNgayTaoHoaDon(),
                x.getNgayThanhToan(),
                x.getSdt(),
                x.getDiaChi(),
                x.getGhiChu()
            });
            System.out.println(listHDVM);
        }
    }//GEN-LAST:event_btnSearchHDActionPerformed

    private void btnHienThiHDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnHienThiHDActionPerformed
        listHDVM = HDservice.getListHoaDon();
        loadTableHoaDon();
    }//GEN-LAST:event_btnHienThiHDActionPerformed

    private void cbbSapXepHDItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cbbSapXepHDItemStateChanged
        String index = (String) cbbSapXepHD.getSelectedItem();
        if (index == "Sap xep theo ten NV A-->Z") {
            Collections.reverse(listHDVM);
            Collections.sort(listHDVM, new Comparator<HoaDonViewModel>() {
                @Override
                public int compare(HoaDonViewModel o1, HoaDonViewModel o2) {
                    return o1.getTenNV().compareToIgnoreCase(o2.getTenNV());
                }
            });
            loadTableHoaDon();
        } else if (index == "Sap xep theo ten NV Z-->A") {
            Collections.reverse(listHDVM);
            Collections.sort(listHDVM, new Comparator<HoaDonViewModel>() {
                @Override
                public int compare(HoaDonViewModel o1, HoaDonViewModel o2) {
                    return o2.getTenNV().compareToIgnoreCase(o1.getTenNV());
                }
            });
            loadTableHoaDon();
            System.out.println(listHDVM);

        } else if (index == "Sap xep theo gia giam dan") {
            Collections.sort(listHDVM, new Comparator<HoaDonViewModel>() {
                @Override
                public int compare(HoaDonViewModel o1, HoaDonViewModel o2) {
                    return o1.getThanhTien().compareTo(o2.getThanhTien());
                }
            });
            loadTableHoaDon();
        } else if (index == "Sap xep theo gia tang dan") {
            Collections.sort(listHDVM, new Comparator<HoaDonViewModel>() {
                @Override
                public int compare(HoaDonViewModel o1, HoaDonViewModel o2) {
                    return o2.getThanhTien().compareTo(o1.getThanhTien());
                }
            });
            loadTableHoaDon();
        } else if (index == "Sap xep theo trang thai chua thanh toan") {
            Collections.sort(listHDVM, new Comparator<HoaDonViewModel>() {
                @Override
                public int compare(HoaDonViewModel o1, HoaDonViewModel o2) {
                    return Integer.compare(o2.getTrangThai(), o1.getTrangThai());
                }
            });
            loadTableHoaDon();
        } else if (index == "Sap xep theo trang thai da thanh toan") {
            Collections.sort(listHDVM, new Comparator<HoaDonViewModel>() {
                @Override
                public int compare(HoaDonViewModel o1, HoaDonViewModel o2) {
                    return Integer.compare(o1.getTrangThai(), o2.getTrangThai());
                }
            });
            loadTableHoaDon();
        }
    }//GEN-LAST:event_cbbSapXepHDItemStateChanged

    private void cbbSapXepHDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbbSapXepHDActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cbbSapXepHDActionPerformed

    private void rdoThanhToanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_rdoThanhToanActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_rdoThanhToanActionPerformed

    private void rdoChoThanhToanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_rdoChoThanhToanActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_rdoChoThanhToanActionPerformed

    private void cbDangKyBienActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbDangKyBienActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cbDangKyBienActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        // TODO add your handling code here:
        Integer maNV = (int) cbbMaNV.getSelectedIndex();
        if (maNV.equals(0)) {
            lbTenNV.setText("Chống Thiện Mỹ");
        } else if (maNV.equals(1)) {
            lbTenNV.setText("Phạm Khương Duy");
        } else if (maNV.equals(2)) {
            lbTenNV.setText("Bùi Thị Hạnh");
        } else if (maNV.equals(3)) {
            lbTenNV.setText("Vũ Minh Hà");
        } else if (maNV.equals(4)) {
            lbTenNV.setText("Lê Nga Hằng");
        } else if (maNV.equals(5)) {
            lbTenNV.setText("Duy Phạm");
        } else if (maNV.equals(6)) {
            lbTenNV.setText("Nguyễn Văn Minh");
        } else if (maNV.equals(7)) {
            lbTenNV.setText("Phạm Văn Đức");
        }
        String manv = "";
        String tenNVselected = lbTenNV.getText();
        if (tenNVselected.equals("Chống Thiện Mỹ")) {
            manv = "NV01";
        } else if (tenNVselected.equals("Phạm Khương Duy")) {
            manv = "NV02";
        } else if (tenNVselected.equals("Bùi Thị Hạnh")) {
            manv = "NV03";
        } else if (tenNVselected.equals("Vũ Minh Hà")) {
            manv = "NV04";
        } else if (tenNVselected.equals("Lê Nga Hằng")) {
            manv = "NV05";
        } else if (tenNVselected.equals("Duy Phạm")) {
            manv = "NV06";
        } else if (tenNVselected.equals("Nguyễn Văn Minh")) {
            manv = "NV07";
        } else if (tenNVselected.equals("Phạm Văn Đức")) {
            manv = "NV08";
        }
        String tenNV = lbTenNV.getText();
        String maHD = lbMaHD.getText();
        String khachTra = txtKhachTra.getText();
        int trangThai;
        String soLuong = txtSoLuong.getText();
        if (rdoChoThanhToan.isSelected()) {
            trangThai = 1;
        } else {
            trangThai = 0;
        }
        JOptionPane.showMessageDialog(this, HDservice.update(new HoaDonViewModel(manv, tenNV, maHD, Integer.parseInt(txtSoLuong.getText()), BigDecimal.valueOf(Double.parseDouble(lbTongtienxe.getText())), BigDecimal.valueOf(Double.parseDouble(txtKhachTra.getText())), trangThai), maHD));
        listHDVM = HDservice.getListHoaDon();
        loadTableHoaDon();
    }//GEN-LAST:event_jButton6ActionPerformed

    private void cbbMaNVItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cbbMaNVItemStateChanged
        Integer maNV = (int) cbbMaNV.getSelectedIndex();
        if (maNV.equals(0)) {
            lbTenNV.setText("Chống Thiện Mỹ");
        } else if (maNV.equals(1)) {
            lbTenNV.setText("Phạm Khương Duy");
        } else if (maNV.equals(2)) {
            lbTenNV.setText("Bùi Thị Hạnh");
        } else if (maNV.equals(3)) {
            lbTenNV.setText("Vũ Minh Hà");
        } else if (maNV.equals(4)) {
            lbTenNV.setText("Lê Nga Hằng");
        } else if (maNV.equals(5)) {
            lbTenNV.setText("Duy Phạm");
        } else if (maNV.equals(6)) {
            lbTenNV.setText("Nguyễn Văn Minh");
        } else if (maNV.equals(7)) {
            lbTenNV.setText("Phạm Văn Đức");
        }
    }//GEN-LAST:event_cbbMaNVItemStateChanged

    private void cbbMaNVActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbbMaNVActionPerformed

    }//GEN-LAST:event_cbbMaNVActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        listSpVMD = spImpl.getListSP();
        loadTable();
    }//GEN-LAST:event_jButton1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnHienThiHD;
    private javax.swing.JButton btnSearch;
    private javax.swing.JButton btnSearchHD;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JCheckBox cbBaoHiemXe;
    private javax.swing.JCheckBox cbDangKyBien;
    private javax.swing.JComboBox<MaNhanVienVM> cbbMaNV;
    private javax.swing.JComboBox<String> cbbSapXep;
    private javax.swing.JComboBox<String> cbbSapXepHD;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTabbedPane jTabbedPane2;
    private javax.swing.JLabel lbDonGia;
    private javax.swing.JLabel lbGiaGiam;
    private javax.swing.JLabel lbMaHD;
    private javax.swing.JLabel lbManv;
    private javax.swing.JLabel lbMasp;
    private javax.swing.JLabel lbTenNV;
    private javax.swing.JLabel lbTensp;
    private javax.swing.JLabel lbTienTraLai;
    private javax.swing.JLabel lbTongtienxe;
    private javax.swing.JRadioButton rdoChoThanhToan;
    private javax.swing.JRadioButton rdoThanhToan;
    private javax.swing.JTable tblHoaDon;
    private javax.swing.JTable tblLuachonsp;
    private javax.swing.JTable tbldanhsachsp;
    private javax.swing.JTextArea txaGhichu;
    private javax.swing.JTextField txtKhachTra;
    private javax.swing.JTextField txtSoLuong;
    private javax.swing.JTextField txtTenKH;
    private javax.swing.JTextField txtTimKiem;
    private javax.swing.JTextField txtTimKiemHD;
    // End of variables declaration//GEN-END:variables

    
}
