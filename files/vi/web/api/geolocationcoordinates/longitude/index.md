---
title: "GeolocationCoordinates: thuộc tính longitude"
short-title: longitude
slug: Web/API/GeolocationCoordinates/longitude
page-type: web-api-instance-property
browser-compat: api.GeolocationCoordinates.longitude
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Thuộc tính chỉ đọc **`longitude`** của giao diện {{domxref("GeolocationCoordinates")}} là một số biểu thị kinh độ của một vị trí địa lý, được xác định bằng độ thập phân.
Cùng với một dấu thời gian, được cung cấp dưới dạng {{Glossary("Unix time")}} tính bằng mili giây, cho biết thời điểm đo, đối tượng `GeolocationCoordinates` là một phần của giao diện {{domxref("GeolocationPosition")}}, vốn là kiểu đối tượng được trả về bởi các hàm của Geolocation API dùng để lấy và trả về một vị trí địa lý.

## Giá trị

Giá trị trong `longitude` là kinh độ địa lý của vị trí trên Trái Đất do đối tượng `Coordinates` mô tả, tính bằng độ thập phân. Giá trị này được xác định bởi đặc tả World Geodetic System 1984 (WGS 84).

> [!NOTE]
> Kinh tuyến gốc (còn được gọi là prime meridian hoặc reference meridian) không hoàn toàn giống với kinh tuyến Greenwich mà đa số mọi người thường nghĩ đến. Thay vào đó, đó là [IERS Reference Meridian](https://en.wikipedia.org/wiki/IERS_Reference_Meridian), nằm lệch về phía đông của [kinh tuyến Greenwich](https://en.wikipedia.org/wiki/Greenwich_meridian) 5,3 [arcsecond](https://en.wikipedia.org/wiki/Arcseconds) (102 mét / 335 feet). Đây cũng là tiêu chuẩn được [Global Positioning System](https://en.wikipedia.org/wiki/Global_Positioning_System) (GPS) sử dụng.

## Ví dụ

Trong ví dụ đơn giản này, chúng ta lấy vị trí của người dùng và hiển thị các tọa độ thu được sau khi chúng được trả về.

### JavaScript

Mã JavaScript bên dưới tạo một trình lắng nghe sự kiện để khi người dùng nhấp vào một nút, thông tin vị trí sẽ được lấy và hiển thị.

```js
let button = document.getElementById("get-location");
let latText = document.getElementById("latitude");
let longText = document.getElementById("longitude");

button.addEventListener("click", () => {
  navigator.geolocation.getCurrentPosition((position) => {
    let lat = position.coords.latitude;
    let long = position.coords.longitude;

    latText.innerText = lat.toFixed(2);
    longText.innerText = long.toFixed(2);
  });
});
```

Sau khi thiết lập các biến để tham chiếu thuận tiện hơn đến phần tử nút và hai phần tử sẽ được dùng để hiển thị vĩ độ và kinh độ, trình lắng nghe sự kiện được thiết lập bằng cách gọi {{domxref("EventTarget.addEventListener", "addEventListener()")}} trên phần tử {{HTMLElement("button")}}. Khi người dùng nhấp vào nút, chúng ta sẽ lấy và hiển thị thông tin vị trí.

Khi nhận một sự kiện {{domxref("Element/click_event", "click")}}, chúng ta gọi {{domxref("Geolocation.getCurrentPosition", "getCurrentPosition()")}} để yêu cầu vị trí hiện tại của thiết bị. Đây là một yêu cầu bất đồng bộ, vì vậy chúng ta cung cấp một callback nhận vào một đối tượng {{domxref("GeolocationPosition")}} mô tả vị trí đã xác định.

Từ đối tượng `GeolocationPosition`, chúng ta lấy vĩ độ và kinh độ của người dùng bằng {{domxref("GeolocationCoordinates/latitude", "position.coords.latitude")}} và `position.coords.longitude` để có thể cập nhật các tọa độ đã hiển thị. Hai phần tử {{HTMLElement("span")}} được cập nhật để hiển thị các giá trị tương ứng sau khi được chuyển sang giá trị có hai chữ số thập phân.

### HTML

HTML được dùng để hiển thị kết quả trông như sau:

```html
<p>
  Your location is <span id="latitude">0.00</span>° latitude by
  <span id="longitude">0.00</span>° longitude.
</p>
<button id="get-location">Get My Location</button>
```

### Kết quả

Hãy thử ví dụ này tại đây:

{{EmbedLiveSample("Examples", 600, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- Giao diện {{domxref("GeolocationCoordinates")}} mà nó thuộc về.
- Giao diện {{domxref("GeolocationPosition")}}, là giao diện cấp cao nhất được dùng để trả về dữ liệu geolocation từ các hàm của Geolocation API {{domxref("Geolocation.getCurrentPosition()")}} và {{domxref("Geolocation.watchPosition", "watchPosition()")}}.
