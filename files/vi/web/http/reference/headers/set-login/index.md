---
title: Set-Login header
short-title: Set-Login
slug: Web/HTTP/Reference/Headers/Set-Login
page-type: http-header
browser-compat: http.headers.Set-Login
sidebar: http
---

Tiêu đề HTTP **`Set-Login`** {{Glossary("response header")}} được gửi bởi nhà cung cấp danh tính liên kết (IdP) để đặt trạng thái đăng nhập của nó, và cho biết liệu có người dùng nào đang đăng nhập vào IdP trên trình duyệt hiện tại hay không.
Điều này được trình duyệt lưu trữ và sử dụng bởi [FedCM API](/en-US/docs/Web/API/FedCM_API) để giảm số lượng yêu cầu nó thực hiện đến IdP vì trình duyệt không cần yêu cầu tài khoản khi không có người dùng nào đăng nhập vào IdP.
Nó cũng giảm thiểu [các cuộc tấn công timing tiềm ẩn](https://github.com/w3c-fedid/FedCM/issues/447).

Tiêu đề có thể được đặt trên bất kỳ phản hồi nào xuất phát từ điều hướng cấp cao hoặc yêu cầu tài nguyên phụ cùng nguồn gốc trên trang web của IdP.
Bất kỳ tương tác nào với trang web IdP đều có thể dẫn đến việc tiêu đề này được đặt và trạng thái đăng nhập được trình duyệt lưu trữ.

Xem [Cập nhật trạng thái đăng nhập bằng Login Status API](/en-US/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) để biết thêm thông tin về trạng thái đăng nhập FedCM.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Set-Login: <status>
```

## Chỉ thị

- `<status>`
  - : Chuỗi đại diện cho trạng thái đăng nhập cần đặt cho IdP. Các giá trị có thể là:
    - `logged-in`: IdP có ít nhất một tài khoản người dùng đã đăng nhập.
    - `logged-out`: Tất cả tài khoản người dùng IdP hiện đang đăng xuất.

    > [!NOTE]
    > Trình duyệt bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Ví dụ

```http
Set-Login: logged-in

Set-Login: logged-out
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API)
