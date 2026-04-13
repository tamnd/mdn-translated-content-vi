---
title: "HTMLGeolocationElement: thuộc tính watch"
short-title: watch
slug: Web/API/HTMLGeolocationElement/watch
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.watch
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`watch`** của giao diện {{domxref("HTMLGeolocationElement")}} lấy và đặt một giá trị boolean cho biết liệu trình duyệt có nên liên tục cập nhật dữ liệu vị trí của người dùng mỗi khi vị trí thiết bị thay đổi, hay chỉ lấy một lần.

Nó phản ánh giá trị của thuộc tính [`watch`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#watch) của `<geolocation>`.

## Giá trị

Một giá trị boolean:

- Nếu `true`, dữ liệu vị trí được yêu cầu liên tục, như thể phương thức {{domxref("Geolocation.watchPosition()")}} được gọi.
- Nếu `false`, dữ liệu vị trí chỉ được yêu cầu một lần, như thể phương thức {{domxref("Geolocation.getCurrentPosition()")}} được gọi.

Mặc định là `false`.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation watch></geolocation>
```

```js
const geo = document.querySelector("geolocation");
console.log(geo.watch); // true
```

### Lấy dữ liệu vị trí liên tục

Trong ví dụ này, chúng tôi lấy dữ liệu vị trí liên tục và in nó ra trang.

#### HTML

Chúng tôi bao gồm một phần tử {{htmlelement("geolocation")}} với thuộc tính `watch` được đặt trên đó. Khi người dùng nhấp vào nút kết quả và cấp quyền sử dụng tính năng `geolocation`, trình duyệt sẽ bắt đầu yêu cầu dữ liệu vị trí liên tục, mỗi khi vị trí thiết bị của người dùng thay đổi. Chúng tôi cũng bao gồm một phần tử {{htmlelement("p")}} để xuất dữ liệu vị trí và lỗi vào.

```html
<geolocation watch></geolocation>
<p id="output"></p>
```

#### JavaScript

Trong JavaScript của chúng tôi, trước tiên chúng tôi lấy tham chiếu đến đoạn đầu ra và phần tử `<geolocation>`, và kiểm tra giá trị `watch` bằng cách truy cập thuộc tính `watch`.

```js
const outputElem = document.querySelector("#output");
const geo = document.querySelector("geolocation");
console.log(geo.watch); // true
```

Tiếp theo, chúng tôi thêm trình lắng nghe sự kiện {{domxref("HTMLGeolocationElement.location_event", "location")}} vào đối tượng `HTMLGeolocationElement` kết quả, để phát hiện khi yêu cầu dữ liệu vị trí được trả về. Nếu dữ liệu được trả về thành công, chúng tôi truy cập nó thông qua thuộc tính {{domxref("HTMLGeolocationElement.position")}} và in các giá trị vĩ độ và kinh độ vào đoạn đầu ra. Nếu yêu cầu dữ liệu thất bại, chúng tôi truy cập lỗi thông qua thuộc tính {{domxref("HTMLGeolocationElement.error")}} và in thông báo lỗi vào đoạn đầu ra.

```js
geo.addEventListener("location", () => {
  if (geo.position) {
    outputElem.textContent += `(${geo.position.coords.latitude},${geo.position.coords.longitude}), `;
  } else if (geo.error) {
    outputElem.textContent += `${geo.error.message}, `;
  }
});
```

#### Kết quả

Xem mã này [chạy trực tiếp](https://mdn.github.io/dom-examples/geolocation-element/basic-watch-example/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/basic-watch-example)). Mã đầy đủ cũng bao gồm dự phòng cho các trình duyệt không hỗ trợ phần tử `<geolocation>`.

Hãy thử xem bản demo trong trình duyệt được hỗ trợ và trình duyệt không được hỗ trợ nếu có thể, và lưu ý sự khác biệt trong luồng hộp thoại quyền khi bạn chọn cho phép hoặc từ chối quyền sử dụng `geolocation`.

Cũng lưu ý rằng, vì thuộc tính `watch` của `<geolocation>` được đặt thành `true`, dữ liệu vị trí sẽ được yêu cầu và sự kiện `location` sẽ kích hoạt liên tục, mỗi lần người dùng thay đổi vị trí.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
