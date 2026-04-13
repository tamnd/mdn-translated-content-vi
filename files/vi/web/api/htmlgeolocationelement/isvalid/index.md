---
title: "HTMLGeolocationElement: thuộc tính isValid"
short-title: isValid
slug: Web/API/HTMLGeolocationElement/isValid
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.isValid
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`isValid`** chỉ đọc của giao diện {{domxref("HTMLGeolocationElement")}} trả về một giá trị boolean cho biết phần tử {{htmlelement("geolocation")}} liên quan là hợp lệ hay không hợp lệ (bị chặn).

Khi một [bộ chặn](/en-US/docs/Web/HTML/Reference/Elements/geolocation#geolocation_blocking) đang hoạt động trên phần tử `<geolocation>`, nó bị ngăn không hoạt động (không hợp lệ), tạm thời hoặc vĩnh viễn, tùy thuộc vào lý do.

Bạn có thể trả về lý do tại sao nó không hợp lệ thông qua thuộc tính {{domxref("HTMLGeolocationElement.invalidReason")}} — xem trang đó để có danh sách đầy đủ các lý do có thể.

## Giá trị

Một giá trị boolean:

- Nếu `true`, phần tử `<geolocation>` hợp lệ và hoạt động, nghĩa là nó có thể được sử dụng để yêu cầu dữ liệu vị trí.
- Nếu `false`, phần tử `<geolocation>` không hợp lệ và không hoạt động, nghĩa là nó không thể được sử dụng để yêu cầu dữ liệu vị trí.

Mặc định là `false`.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation></geolocation>
```

```js
const geo = document.querySelector("geolocation");
console.log(geo.isValid);
// true, provided the `<geolocation>` element is not blocked in some way
```

Xem trang {{domxref("HTMLGeolocationElement.invalidReason")}} để có ví dụ hoàn chỉnh hơn liên quan đến `isValid`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
