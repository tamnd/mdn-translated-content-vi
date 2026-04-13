---
title: "HTMLGeolocationElement: thuộc tính autolocate"
short-title: autolocate
slug: Web/API/HTMLGeolocationElement/autolocate
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.autolocate
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`autolocate`** của giao diện {{domxref("HTMLGeolocationElement")}} lấy và đặt một giá trị boolean cho biết liệu trình duyệt có nên ngay lập tức yêu cầu dữ liệu vị trí khi phần tử {{htmlelement("geolocation")}} được hiển thị không, với điều kiện quyền sử dụng tính năng `geolocation` đã được cấp.

Nó phản ánh giá trị của thuộc tính [`autolocate`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#autolocate) của `<geolocation>`.

## Giá trị

Một giá trị boolean:

- Nếu `true`, dữ liệu vị trí được yêu cầu ngay khi phần tử `<geolocation>` được hiển thị, với điều kiện quyền sử dụng tính năng `geolocation` đã được cấp trước đó.
- Nếu `false`, dữ liệu vị trí chỉ được yêu cầu khi người dùng nhấn nút `<geolocation>`.

Mặc định là `false`.

Nếu quyền sử dụng tính năng `geolocation` chưa được cấp trước đó, thuộc tính `autolocate` sẽ bị bỏ qua.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation autolocate></geolocation>
```

```js
const geo = document.querySelector("geolocation");
console.log(geo.autolocate); // true
```

Xem [hướng dẫn ví dụ bản đồ nhúng](/en-US/docs/Web/API/HTMLGeolocationElement#embedded_map_example) để có ví dụ thực tế bao gồm `autolocate`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
