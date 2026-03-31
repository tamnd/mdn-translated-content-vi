---
title: "Content-Security-Policy: sandbox directive"
short-title: sandbox
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/sandbox
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.sandbox
sidebar: http
---

Chỉ thị **`sandbox`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) kích hoạt sandbox cho tài nguyên được yêu cầu tương tự như thuộc tính [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) của {{HTMLElement("iframe")}}.
Nó áp dụng các hạn chế đối với các hành động của trang bao gồm ngăn các popup, ngăn thực thi plugin và script, và thực thi chính sách cùng nguồn gốc.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>1.1 / 2</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Document directive")}}</td>
    </tr>
    <tr>
      <th colspan="2" scope="row">
        Chỉ thị này không được hỗ trợ trong phần tử {{HTMLElement("meta")}} hoặc bởi trường tiêu đề {{HTTPHeader("Content-Security-policy-Report-Only")}}.
      </th>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: sandbox;
Content-Security-Policy: sandbox <value>;
```

trong đó `<value>` có thể tùy chọn là một trong các giá trị sau:

- `allow-downloads`
  - : Cho phép tải xuống tệp thông qua phần tử {{HTMLElement("a")}} hoặc {{HTMLElement("area")}} với thuộc tính [download](/en-US/docs/Web/HTML/Reference/Elements/a#download), cũng như thông qua điều hướng dẫn đến tải xuống tệp.
    Điều này hoạt động bất kể người dùng có nhấp vào liên kết hay mã JS khởi tạo mà không có tương tác người dùng.
- `allow-forms`
  - : Cho phép trang gửi biểu mẫu. Nếu từ khóa này không được sử dụng, biểu mẫu sẽ được hiển thị bình thường, nhưng việc gửi nó sẽ không kích hoạt xác thực đầu vào, gửi dữ liệu đến máy chủ web hoặc đóng hộp thoại.
- `allow-modals`
  - : Cho phép trang mở cửa sổ modal bằng {{domxref("Window.alert()")}}, {{domxref("Window.confirm()")}}, {{domxref("Window.print()")}} và {{domxref("Window.prompt()")}}, trong khi mở {{HTMLElement("dialog")}} được phép bất kể từ khóa này. Nó cũng cho phép trang nhận sự kiện {{domxref("BeforeUnloadEvent")}}.
- `allow-orientation-lock`
  - : Cho phép tài nguyên [khóa hướng màn hình](/en-US/docs/Web/API/Screen/lockOrientation).
- `allow-pointer-lock`
  - : Cho phép trang sử dụng [Pointer Lock API](/en-US/docs/Web/API/Pointer_Lock_API).
- `allow-popups`
  - : Cho phép popup (được tạo, ví dụ, bằng {{domxref("Window.open()")}} hoặc `target="_blank"`).
    Nếu từ khóa này không được sử dụng, hiển thị popup sẽ thất bại một cách im lặng.
- `allow-popups-to-escape-sandbox`
  - : Cho phép tài liệu sandboxed mở cửa sổ mới mà không buộc các cờ sandboxing lên chúng. Điều này sẽ cho phép, ví dụ, một quảng cáo của bên thứ ba được sandboxed một cách an toàn mà không buộc các hạn chế tương tự lên trang mà quảng cáo liên kết đến.
- `allow-presentation`
  - : Cho phép người nhúng có quyền kiểm soát liệu một iframe có thể bắt đầu một [phiên trình bày](/en-US/docs/Web/API/PresentationRequest) hay không.
- `allow-same-origin`
  - : Cho phép tài nguyên sandboxed giữ lại {{Glossary("origin")}} của nó.
    Tài nguyên sandboxed nếu không sẽ được coi là từ một [opaque origin](/en-US/docs/Glossary/Origin#opaque_origin), đảm bảo rằng nó sẽ luôn thất bại khi kiểm tra {{Glossary("same-origin policy")}}, và do đó không thể truy cập [`localstorage` và `document.cookie`](/en-US/docs/Web/Security/Defenses/Same-origin_policy#cross-origin_data_storage_access) và một số JavaScript API.
    {{httpheader("Origin")}} của các tài nguyên sandboxed không có từ khóa `allow-same-origin` là `null`.
- `allow-scripts`
  - : Cho phép trang chạy script (nhưng không tạo cửa sổ popup). Nếu từ khóa này không được sử dụng, thao tác này không được phép.
- `allow-storage-access-by-user-activation` {{experimental_inline}}
  - : Cho phép tài nguyên yêu cầu quyền truy cập vào khả năng lưu trữ của cha mẹ bằng [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).
- `allow-top-navigation`
  - : Cho phép tài nguyên điều hướng ngữ cảnh duyệt cấp cao nhất (cái được đặt tên là `_top`).
- `allow-top-navigation-by-user-activation`
  - : Cho phép tài nguyên điều hướng ngữ cảnh duyệt cấp cao nhất, nhưng chỉ khi được khởi tạo bởi cử chỉ người dùng.
- `allow-top-navigation-to-custom-protocols`
  - : Cho phép điều hướng đến các giao thức không phải `http` được tích hợp vào trình duyệt hoặc [được đăng ký bởi một trang web](/en-US/docs/Web/API/Navigator/registerProtocolHandler). Tính năng này cũng được kích hoạt bởi từ khóa `allow-popups` hoặc `allow-top-navigation`.

> [!NOTE]
> Các giá trị `allow-top-navigation` và các giá trị liên quan chỉ có ý nghĩa đối với các tài liệu nhúng (chẳng hạn như iframe con). Đối với các tài liệu độc lập, các giá trị này không có tác dụng, vì ngữ cảnh duyệt cấp cao nhất là chính tài liệu đó.

## Ví dụ

```http
Content-Security-Policy: sandbox allow-scripts;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- Thuộc tính [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) trên các phần tử {{HTMLElement("iframe")}}
