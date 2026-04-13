---
title: "HTMLGeolocationElement: thuộc tính error"
short-title: error
slug: Web/API/HTMLGeolocationElement/error
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.error
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`error`** chỉ đọc của giao diện {{domxref("HTMLGeolocationElement")}} trả về một đối tượng {{domxref("GeolocationPositionError")}} đại diện cho thông tin lỗi, trong trường hợp không lấy được dữ liệu vị trí.

Nếu việc lấy dữ liệu vị trí thành công, dữ liệu sẽ có sẵn trong thuộc tính {{domxref("HTMLGeolocationElement.position")}}.

## Giá trị

Một đối tượng {{domxref("GeolocationPositionError")}}, hoặc `null` nếu dữ liệu vị trí được lấy thành công.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation autolocate></geolocation>
```

```js
const geo = document.querySelector("geolocation");
geo.addEventListener("location", () => {
  if (geo.position) {
    console.log(
      `(${geo.position.coords.latitude},${geo.position.coords.longitude})`,
    );
  } else if (geo.error) {
    console.log(geo.error.message);
  }
});
```

Xem [hướng dẫn ví dụ bản đồ nhúng](/en-US/docs/Web/API/HTMLGeolocationElement#embedded_map_example) để có ví dụ thực tế bao gồm `error`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
