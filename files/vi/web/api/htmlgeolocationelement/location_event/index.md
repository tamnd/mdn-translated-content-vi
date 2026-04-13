---
title: "HTMLGeolocationElement: sự kiện location"
short-title: location
slug: Web/API/HTMLGeolocationElement/location_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.location_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Sự kiện **`location`** của giao diện {{domxref("HTMLGeolocationElement")}} được kích hoạt mỗi khi trình duyệt nhận được dữ liệu vị trí, hoặc thông tin lỗi khi yêu cầu dữ liệu vị trí không thành công.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("location", (event) => { })

onlocation = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Ví dụ

### Sử dụng `location` để phản hồi dữ liệu vị trí và lỗi

Trong [bản demo Bản đồ nhúng](https://mdn.github.io/dom-examples/geolocation-element/embedded-map/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/embedded-map)) của chúng tôi, chúng tôi sử dụng trình xử lý sự kiện `location` để phản hồi dữ liệu vị trí và lỗi được nhận:

```js
geo.addEventListener("location", () => {
  if (geo.position) {
    console.log(
      `${geo.position.coords.latitude},${geo.position.coords.longitude}`,
    );
    drawMap(geo.position.coords.latitude, geo.position.coords.longitude, geo);
  } else if (geo.error) {
    console.log(geo.error.message);
  }
});
```

Nếu dữ liệu vị trí được trả về thành công, chúng tôi truy cập nó thông qua thuộc tính {{domxref("HTMLGeolocationElement.position")}} và lấy các giá trị vĩ độ và kinh độ. Chúng tôi ghi log chúng vào bảng điều khiển, sau đó vẽ chúng trên bản đồ bằng cách truyền chúng vào hàm `drawMap()` cùng với tham chiếu đến đối tượng `HTMLGeolocationElement`. Nếu yêu cầu dữ liệu thất bại, chúng tôi truy cập lỗi thông qua thuộc tính {{domxref("HTMLGeolocationElement.error")}} và ghi log thông báo lỗi vào bảng điều khiển.

Xem trang chính {{domxref("HTMLGeolocationElement")}} để có hướng dẫn đầy đủ về ví dụ này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
