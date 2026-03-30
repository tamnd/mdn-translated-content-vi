---
title: Tiêm SQL
slug: Glossary/SQL_Injection
page-type: glossary-definition
sidebar: glossarysidebar
---

SQL injection lợi dụng các ứng dụng web không kiểm tra đầu vào của người dùng. Hacker có thể cố tình truyền các lệnh SQL qua ứng dụng web để thực thi trên cơ sở dữ liệu phía sau.

SQL injection có thể đạt được quyền truy cập trái phép vào cơ sở dữ liệu hoặc truy xuất thông tin trực tiếp từ cơ sở dữ liệu. Nhiều vụ rò rỉ dữ liệu xảy ra do SQL injection.

![Biểu đồ tròn về các lỗ hổng phổ biến nhất: SQL Injection chiếm 50% lỗ hổng, Cross Site Scripting chiếm 42%, Source Code Disclosure chiếm 7%.](sql_inj_xss.gif)

[Nguồn](https://cdn.acunetix.com/wp_content/uploads/2010/09/sql_inj_xss.gif)

## Cách thức hoạt động

![Ảnh chụp màn hình biểu mẫu đăng nhập với các trường tên người dùng và mật khẩu](updates_loginscreen.png)

Sau khi nhập tên người dùng và mật khẩu, đằng sau giao diện đồ họa, các truy vấn SQL hoạt động như sau:

```sql
"SELECT Count(*) FROM Users WHERE Username=' " + txt.User.Text+" ' AND Password=' "+ txt.Password.Text+" ' ";
```

Giả sử người dùng nhập Username: admin và Password: passwd123, sau khi nhấp vào nút Đăng nhập, truy vấn SQL sẽ chạy như sau:

```sql
"SELECT Count(*) FROM Users WHERE Username=' admin ' AND Password=' passwd123 ' ";
```

Nếu thông tin đăng nhập đúng, người dùng được phép đăng nhập - đây là cơ chế rất đơn giản (và do đó không an toàn). Hacker lợi dụng điểm yếu này để truy cập trái phép.

Hacker sử dụng một chuỗi đơn giản gọi là "Chuỗi Ma thuật", ví dụ:

**Username: _admin_**

**Password: _anything 'or'1'='1_**

Sau khi nhấp vào nút đăng nhập, truy vấn SQL sẽ hoạt động như sau:

```sql
"SELECT Count(*) FROM Users WHERE Username=' admin ' AND Password=' anything 'or'1'='1 ' ";
```

Hãy chú ý kỹ phần mật khẩu trong truy vấn trên.

```plain
Password=' anything 'or'1'='1 '
```

Mật khẩu không phải là 'anything', nên password=anything trả về FALSE, nhưng '1'='1' là mệnh đề TRUE và trả về giá trị TRUE. Cuối cùng, do toán tử OR, giá trị (FALSE OR TRUE) là TRUE, nên việc xác thực bị vượt qua thành công. Chỉ nhờ một chuỗi đơn giản (Chuỗi Ma thuật), toàn bộ cơ sở dữ liệu bị xâm phạm.

## Cách phòng ngừa

Trước khi thực thi các truy vấn cho thông tin đăng nhập của người dùng, hãy thực hiện một số thay đổi như sau:

```php
$id = $_GET["id"]

(1) $id = stripslashes($id)

(2) $id = mysql_real_escape_String($id)
```

Do (1), mỗi dấu nháy đơn (') trong chuỗi đầu vào được thay thế bằng dấu nháy kép ("), và do (2), trước mỗi (') sẽ thêm (/). Chuỗi ma thuật được sửa đổi sẽ không vượt qua được xác thực, và cơ sở dữ liệu của bạn được bảo vệ an toàn.

## Xem thêm

- [SQL injection](https://en.wikipedia.org/wiki/SQL_injection) trên Wikipedia
- [Giải thích về SQL injection](https://owasp.org/www-community/attacks/SQL_Injection) trên OWASP (Dự án Bảo mật Ứng dụng Web Mở)
