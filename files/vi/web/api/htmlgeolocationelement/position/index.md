---
title: "HTMLGeolocationElement: thuộc tính position"
short-title: position
slug: Web/API/HTMLGeolocationElement/position
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.position
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`position`** chỉ đọc của giao diện {{domxref("HTMLGeolocationElement")}} trả về một đối tượng {{domxref("GeolocationPosition")}} đại diện cho vị trí của người dùng, trong trường hợp lấy được dữ liệu vị trí thành công.

Vị trí được lấy có thể đã cập nhật hoặc chưa. Vị trí của người dùng chỉ được lấy một lần khi nhấn điều khiển nút của phần tử `<geolocation>`, trừ khi bạn đặt thuộc tính [`watch`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#watch) thành `true`, trong trường hợp đó một vị trí mới sẽ được lấy mỗi lần thiết bị của người dùng di chuyển. Để đọc vị trí hiện tại của người dùng, bạn nên đọc thuộc tính `position` để phản hồi sự kiện {{domxref("HTMLGeolocationElement.location_event", "location")}} được kích hoạt.

Nếu việc lấy dữ liệu vị trí thất bại, thông tin lỗi liên quan sẽ có sẵn trong thuộc tính {{domxref("HTMLGeolocationElement.error")}}.

## Giá trị

Một đối tượng {{domxref("GeolocationPosition")}}, hoặc `null` nếu việc lấy dữ liệu vị trí thất bại hoặc dữ liệu chưa được lấy.

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

Xem [hướng dẫn ví dụ bản đồ nhúng](/en-US/docs/Web/API/HTMLGeolocationElement#embedded_map_example) để có ví dụ thực tế bao gồm `position`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
