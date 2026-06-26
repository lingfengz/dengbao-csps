# 等保安全工程师技能图谱

## 操作系统安全

### Linux 安全加固
- 身份鉴别
  - 密码复杂度策略（pwquality）
  - 密码过期策略（login.defs）
  - 账户锁定策略（faillock/pam_tally2）
  - SSH密钥认证
  - 双因子认证（Google Authenticator）
- 访问控制
  - 文件权限管理（chmod/chown）
  - SUID/SGID排查
  - ACL权限
  - SELinux策略配置
  - AppArmor（Ubuntu）
- 安全审计
  - auditd审计规则配置
  - 审计日志管理
  - 日志集中收集（rsyslog）
  - 日志轮转策略
- 入侵防范
  - 最小安装原则
  - 禁用不必要的服务
  - 端口管理（ss/netstat）
  - 系统更新与补丁管理
  - 漏洞扫描与修复
- 其他加固
  - 禁用Ctrl+Alt+Delete重启
  - 设置登录超时（TMOUT）
  - 限制core dump
  - 禁用USB存储
  - 限制cron使用
- 检查脚本
  - 一键安全检查Shell脚本
  - 巡检报告生成

### Linux 发行版差异
- CentOS 7/RHEL 7
  - firewalld + iptables
  - auditd 2.x
  - SELinux enforcing
- Ubuntu 22.04 LTS
  - UFW防火墙
  - AppArmor
  - unattended-upgrades自动更新
- Rocky Linux 9/RHEL 9
  - firewalld (nftables后端)
  - 系统级加密策略（update-crypto-policies）
  - SELinux enforcing（默认）
  - faillock独立配置文件

### Windows 安全加固
- 账户策略
  - 密码策略（secpol.msc）
  - 账户锁定策略
  - 用户权限分配
  - 安全选项配置
- 审计策略
  - 高级审计策略（auditpol）
  - Windows事件日志配置
  - 日志大小与保留策略
- 安全配置
  - Windows Defender配置
  - Windows防火墙规则
  - BitLocker磁盘加密
  - 服务管理（禁用不必要服务）
  - 注册表安全加固
- 版本差异
  - Windows Server 2016/2019/2022
  - Windows 10/11
  - 安全核心服务器（Secured-core）

## 数据库安全

### MySQL 安全
- 安装后安全配置（mysql_secure_installation）
- 密码策略（validate_password插件）
- 日志审计（general_log/二进制日志）
- 访问控制（用户权限最小化）
- SSL加密连接
- 远程访问限制
- 数据备份（mysqldump + binlog）
- 安全加固检查清单

### Redis 安全
- 绑定IP限制
- 密码认证（requirepass）
- 修改默认端口
- ACL配置（Redis 6.0+）
- 禁用危险命令（FLUSHALL/KEYS/CONFIG）
- 保护模式（protected-mode yes）
- 非root运行
- 备份策略（RDB/AOF）
- 未授权访问检测
- 历史漏洞修复（CVE-2022-0543等）

### Oracle 安全
- 密码策略（PROFILE配置）
- 默认账户锁定（SCOTT/HR等）
- 审计配置（audit_trail=DB,EXTENDED）
- 权限管理（最小权限原则）
- 回收PUBLIC危险权限（UTL_FILE/UTL_HTTP等）
- 网络安全（SQL*Net加密/TCP访问限制）
- RMAN备份与恢复

### 通用数据库安全
- 弱口令检测
- 超级权限账户管理
- 数据传输加密
- 数据存储加密（TDE）
- 审计日志开启与保存
- 备份恢复策略（3-2-1原则）

## 网络安全

### 网络架构设计
- 安全域划分
  - 互联网区 / DMZ区 / 内网区 / 管理区
  - 生产网 / 办公网 / 测试网分离
  - 最小化网络暴露面
- VLAN隔离
- 网络流量管理

### 边界防护
- 防火墙策略
  - 默认拒绝原则
  - 最小化开放端口
  - 应用层过滤
  - 状态检测
- 入侵检测/防御（IPS/IDS）
  - Snort/Suricata
  - 商业IPS设备
  - 异常流量检测
- WAF（Web应用防火墙）
  - SQL注入防护
  - XSS防护
  - CC攻击防护
  - API安全

### 通信安全
- VPN（IPSec/SSL VPN）
- TLS/SSL配置（TLS 1.2/1.3）
- 数字证书管理
- 传输加密（HTTPS/SSH/SFTP）

### 安全监控
- 网络流量分析
- 异常行为检测
- 威胁情报接入
- 安全事件关联分析

## 应用安全

### 开发安全
- 安全开发生命周期（SDL）
- 代码安全审查
- 依赖库安全扫描（SCA）
- 交互式安全测试（IAST）

### Web安全
- OWASP Top 10 防护
  - A01：访问控制失效
  - A02：加密机制失效
  - A03：注入（SQL/命令/LDAP）
  - A04：不安全设计
  - A05：安全配置错误
  - A06：易受攻击组件
  - A07：身份认证失效
  - A08：软件完整性失效
  - A09：日志监控失效
  - A10：SSRF
- 安全编码规范
- 输入验证与输出编码

### 认证与授权
- 单点登录（SSO）/OAuth2/OIDC
- 多因素认证（MFA）
- 基于角色的访问控制（RBAC）
- 会话管理
- API鉴权（JWT/OAuth）

## 容器与云安全

### Docker 安全
- 守护进程安全配置（daemon.json）
- 容器安全运行参数
  - 只读根文件系统
  - 禁止特权提升
  - 删除所有能力（cap-drop ALL）
  - 用户命名空间映射
- Dockerfile最佳实践
  - 使用特定版本基础镜像
  - 创建非root用户
  - 多阶段构建
- 镜像安全扫描
  - Trivy
  - Docker Scout
  - Snyk
- 日志审计配置

### Kubernetes 安全
- Pod安全标准（PSS）
  - baseline策略
  - restricted策略
- 安全上下文配置
  - runAsNonRoot
  - readOnlyRootFilesystem
  - seccompProfile
- 网络策略（NetworkPolicy）
  - 默认拒绝入站/出站
  - 最小化网络访问
- RBAC配置
  - 最小权限Role
  - RoleBinding/ClusterRoleBinding
- 密钥管理
  - External Secrets Operator
  - Vault集成
- 审计日志
  - API审计策略
  - kube-bench检查

### 云平台安全
- 阿里云
  - RAM账号与MFA
  - 安全组配置（最小化）
  - 云防火墙
  - WAF接入
  - OSS安全（私有+加密）
  - RDS安全（SSL+TDE）
  - ActionTrail审计
  - 日志保留≥180天

## 安全设备运维

### 防火墙
- 策略配置与优化
- 高可用部署（主备/集群）
- 日志分析
- 策略审计

### 入侵检测/防御
- 特征库更新
- 规则调优
- 误报处理
- 告警分析

### 堡垒机
- 统一运维入口
- 操作审计与回放
- 权限分离
- 账号管理

### 日志审计系统
- 日志集中收集
- 关联分析
- 报表生成
- 日志存储管理

### 漏洞扫描设备
- 扫描策略配置
- 周期性扫描
- 漏洞验证
- 漏洞跟踪

## 安全基线自动化

### Ansible 自动化
- Linux基线Playbook
- Windows基线Playbook
- 数据库基线Playbook
- 合规报告生成

### Shell/PowerShell脚本
- Linux一键检查脚本
- Windows一键检查脚本
- 巡检报告自动化

### 安全配置管理
- CIS Benchmark
- 等保基线标准
- 行业安全基线

## 应急响应

### 事件分类
- 勒索病毒
- Web攻击
- 数据泄露
- APT攻击
- 内部威胁
- DDoS攻击

### 应急流程
- 检测与确认
- 隔离与遏制
- 分析与取证
- 清除与恢复
- 复盘与改进

### 常用工具
- 流量分析：Wireshark/tcpdump
- 日志分析：ELK/Splunk
- 内存取证：Volatility
- 磁盘取证：FTK Imager/Autopsy
- 恶意代码分析：IDA Pro/Ghidra
