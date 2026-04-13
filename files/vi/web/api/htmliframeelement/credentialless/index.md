---
title: "HTMLIFrameElement: thuộc tính credentialless"
short-title: credentialless
slug: Web/API/HTMLIFrameElement/credentialless
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLIFrameElement.credentialless
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Thuộc tính **`credentialless`** của giao diện {{domxref("HTMLIFrameElement")}} cho biết {{htmlelement("iframe")}} có không có thông tin xác thực hay không, nghĩa là các tài liệu bên trong sẽ được tải bằng các ngữ cảnh tạm thời mới.

Các ngữ cảnh này không có quyền truy cập vào mạng, cookie và dữ liệu lưu trữ liên quan đến nguồn gốc của chúng. Thay vào đó, chúng sử dụng các tài nguyên mới, cục bộ trong vòng đời của tài liệu cấp cao nhất. Điều này có nghĩa là bất kỳ dữ liệu nào được lưu trữ sẽ không thể truy cập được nữa sau khi người dùng điều hướng ra khỏi trang hoặc tải lại trang.

Đổi lại, các quy tắc nhúng {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP) có thể được dỡ bỏ, cho phép các tài liệu đã đặt COEP nhúng các tài liệu bên thứ ba không đặt COEP. Xem [IFrame credentialless](/en-US/docs/Web/HTTP/Guides/IFrame_credentialless) để biết giải thích chi tiết hơn.

## Giá trị

Một boolean. Giá trị mặc định là `false`; đặt thành `true` để làm cho `<iframe>` không có thông tin xác thực.

## Ví dụ

### Get

Chỉ định một `<iframe>` credentialless như sau:

```html
<iframe
  src="https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)"
  title="Spectre vulnerability Wikipedia page"
  width="960"
  height="600"
  credentialless></iframe>
```

Trả về giá trị thuộc tính `credentialless`:

```js
const iframeElem = document.querySelector("iframe");
console.log(iframeElem.credentialless); // sẽ trả về true trong các trình duyệt hỗ trợ
```

### Set

Hoặc thay thế, chỉ định các thông tin tối thiểu trong HTML:

```html
<iframe width="960" height="600"> </iframe>
```

Và đặt `credentialless` thành `true` rồi tải nội dung `<iframe>` qua script:

```js
const iframeElem = document.querySelector("iframe");

iframeElem.credentialless = true;
iframeElem.title = "Spectre vulnerability Wikipedia page";
iframeElem.src =
  "https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [IFrame credentialless](/en-US/docs/Web/HTTP/Guides/IFrame_credentialless)
- {{htmlelement("iframe")}}
