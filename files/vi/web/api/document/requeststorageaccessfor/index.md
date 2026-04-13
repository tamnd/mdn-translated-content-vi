---
title: "Document: requestStorageAccessFor() method"
short-title: requestStorageAccessFor()
slug: Web/API/Document/requestStorageAccessFor
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Document.requestStorageAccessFor
---

{{APIRef("Storage Access API")}}{{deprecated_header}}

Phương thức **`requestStorageAccessFor()`** của giao diện {{domxref("Document")}} cho phép các trang web cấp cao nhất yêu cầu quyền truy cập cookie bên thứ ba thay mặt cho nội dung nhúng có nguồn gốc từ một trang web khác trong cùng [bộ trang web liên quan](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets). Phương thức trả về một {{jsxref("Promise")}} sẽ giải quyết nếu quyền truy cập được cấp và từ chối nếu quyền truy cập bị từ chối.

## Cú pháp

```js-nolint
requestStorageAccessFor(requestedOrigin)
```

### Tham số

- `requestedOrigin`
  - : Một chuỗi đại diện cho URL của nguồn gốc bạn đang yêu cầu quyền truy cập cookie bên thứ ba.

### Giá trị trả về

Một {{jsxref("Promise")}} thỏa mãn với `undefined` nếu quyền truy cập cookie bên thứ ba được cấp và từ chối nếu quyền truy cập bị từ chối.

Các yêu cầu `requestStorageAccessFor()` tự động bị từ chối trừ khi nội dung cấp cao nhất hiện đang xử lý một cử chỉ người dùng như nhấn hoặc nhấp ({{Glossary("transient activation")}}), hoặc trừ khi quyền đã được cấp trước đó. Nếu quyền chưa được cấp trước đó, chúng phải chạy bên trong một trình xử lý sự kiện dựa trên cử chỉ người dùng. Hành vi cử chỉ người dùng phụ thuộc vào trạng thái của promise:

- Nếu promise được giải quyết (tức là quyền được cấp), thì cử chỉ người dùng chưa bị tiêu thụ, do đó tập lệnh có thể gọi các API yêu cầu cử chỉ người dùng sau đó.
- Nếu promise bị từ chối (tức là quyền không được cấp), thì cử chỉ người dùng đã bị tiêu thụ, do đó tập lệnh không thể làm bất cứ điều gì yêu cầu một cử chỉ. Điều này ngăn các tập lệnh gọi lại `requestStorageAccessFor()` nếu quyền bị từ chối.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("Document")}} hiện tại chưa hoạt động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - Cửa sổ của tài liệu không phải là [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
    - Tài liệu không phải là tài liệu cấp cao nhất.
    - Tài liệu có nguồn gốc `null`.
    - `requestedOrigin` được cung cấp là [opaque](https://html.spec.whatwg.org/multipage/browsers.html#concept-origin-opaque).
    - Các trang web cấp cao nhất và nhúng không nằm trong cùng [bộ trang web liên quan](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets).
    - {{htmlelement("iframe")}} nhúng bị sandbox và token `allow-storage-access-by-user-activation` không được đặt.
    - Việc sử dụng bị chặn bởi {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - Việc sử dụng bị tác nhân người dùng từ chối bởi yêu cầu quyền sử dụng API.
- `TypeError`
  - : Được ném nếu `requestedOrigin` không phải là một URL hợp lệ.

## Mô tả

Phương thức `requestStorageAccessFor()` giải quyết các thách thức trong việc áp dụng Storage Access API trên các trang web cấp cao nhất sử dụng hình ảnh hoặc tập lệnh khác trang web yêu cầu cookie. Nó liên quan đến các tác nhân người dùng theo mặc định chặn quyền truy cập vào cookie bên thứ ba, [không phân vùng](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies) để cải thiện quyền riêng tư (ví dụ: để ngăn chặn theo dõi), và là một phần mở rộng được đề xuất của [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

`requestStorageAccessFor()` có thể cho phép truy cập cookie bên thứ ba cho các tài nguyên khác trang web được nhúng trực tiếp vào một trang web cấp cao nhất mà không thể tự yêu cầu quyền truy cập storage, ví dụ các phần tử {{htmlelement("img")}}. Nội dung khác trang web được nhúng trong `<iframe>` có logic và tài nguyên riêng và cần quyền truy cập cookie bên thứ ba nên yêu cầu quyền truy cập storage thông qua {{domxref("Document.requestStorageAccess()")}}.

Để kiểm tra xem quyền truy cập cookie bên thứ ba đã được cấp thông qua `requestStorageAccessFor()` hay chưa, bạn có thể gọi {{domxref("Permissions.query()")}}, chỉ định tên tính năng `"top-level-storage-access"`. Điều này khác với tên tính năng được sử dụng cho phương thức {{domxref("Document.requestStorageAccess()")}} thông thường, là `"storage-access"`.

Lệnh gọi `Permissions.query()` phải chỉ định nguồn gốc nhúng; ví dụ:

```js
navigator.permissions.query({
  name: "top-level-storage-access",
  requestedOrigin: "https://www.example.com",
});
```

> [!NOTE]
> Việc sử dụng tính năng này có thể bị chặn bởi {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn (cùng một chính sách kiểm soát phần còn lại của Storage Access API). Ngoài ra, tài liệu phải vượt qua các kiểm tra cụ thể của trình duyệt như danh sách cho phép, danh sách chặn, phân loại trên thiết bị, cài đặt người dùng, hoặc heuristic chống-[clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking).

## Ví dụ

```js
function rSAFor() {
  if ("requestStorageAccessFor" in document) {
    document.requestStorageAccessFor("https://example.com").then(
      (res) => {
        // Sử dụng quyền truy cập storage
        doThingsWithCookies();
      },
      (err) => {
        // Xử lý lỗi
      },
    );
  }
}
```

Sau một lệnh gọi `requestStorageAccessFor()` thành công, các yêu cầu khác trang web sẽ bao gồm cookie nếu chúng bao gồm [CORS](/en-US/docs/Web/HTTP/Guides/CORS) / [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), do đó các trang web có thể muốn đợi trước khi kích hoạt yêu cầu. Các yêu cầu như vậy phải sử dụng tùy chọn [`credentials: "include"`](/en-US/docs/Web/API/RequestInit#credentials) và tài nguyên phải bao gồm thuộc tính `crossorigin="use-credentials"`.

Ví dụ:

```js
function checkCookie() {
  fetch("https://example.com/getcookies.json", {
    method: "GET",
    credentials: "include",
  })
    .then((response) => response.json())
    .then((json) => {
      // Làm gì đó
    });
}
```

> [!NOTE]
> Xem [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) để biết ví dụ đầy đủ hơn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.hasStorageAccess()")}}, {{domxref("Document.hasUnpartitionedCookieAccess()")}}, {{domxref("Document.requestStorageAccess()")}}
- [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
- [Introducing Storage Access API](https://webkit.org/blog/8124/introducing-storage-access-api/) (bài viết WebKit)
