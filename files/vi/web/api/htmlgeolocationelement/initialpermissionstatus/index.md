---
title: "HTMLGeolocationElement: thuộc tính initialPermissionStatus"
short-title: initialPermissionStatus
slug: Web/API/HTMLGeolocationElement/initialPermissionStatus
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.initialPermissionStatus
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`initialPermissionStatus`** chỉ đọc của giao diện {{domxref("HTMLGeolocationElement")}} trả về một giá trị liệt kê đại diện cho trạng thái quyền cho tính năng `geolocation` khi trang tải lần đầu.

Nếu bạn muốn truy cập trạng thái quyền hiện tại cho tính năng `geolocation`, hãy sử dụng thuộc tính {{domxref("HTMLGeolocationElement.permissionStatus")}}.

## Giá trị

Một giá trị liệt kê, có thể là một trong:

- `granted`
  - : Người dùng trước đây đã cấp quyền cho trình duyệt sử dụng tính năng `geolocation`, thông qua phần tử {{htmlelement("geolocation")}} hoặc một số cơ chế khác. Khi sử dụng phần tử `<geolocation>`, điều này có nghĩa là người dùng trước đây đã nhấn nút được hiển thị và chọn tùy chọn "cho phép".

    Nếu phần tử `<geolocation>` có thuộc tính [`autolocate`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#autolocate) được đặt thành `true`, và quyền đã được cấp trước đó, trình duyệt sẽ bắt đầu yêu cầu dữ liệu vị trí ngay khi trang tải, mà không cần người dùng nhấn nút.

- `denied`
  - : Người dùng trước đây đã từ chối quyền cho trình duyệt sử dụng tính năng `geolocation`, thông qua phần tử `<geolocation>` hoặc một số cơ chế khác. Khi sử dụng phần tử `<geolocation>`, điều này có nghĩa là người dùng trước đây đã nhấn nút được hiển thị và chọn tùy chọn "không cho phép".
- `prompt`
  - : Người dùng trước đây chưa cấp hoặc từ chối quyền cho trình duyệt sử dụng tính năng `geolocation`. Khi sử dụng phần tử `<geolocation>`, điều này có nghĩa là người dùng chưa nhấn nút được hiển thị.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation></geolocation>
```

```js
const geo = document.querySelector("geolocation");
console.log(geo.initialPermissionStatus);
// "granted" if the user previously granted permission before reloading the page
```

### Sử dụng trạng thái quyền ban đầu để thông báo cho người dùng khi tải trang

Trong ví dụ này, chúng tôi sử dụng trạng thái quyền ban đầu để in một thông báo phù hợp ra màn hình thông báo cho người dùng biết hành động mà nút {{htmlelement("geolocation")}} sẽ thực hiện.

#### HTML

Chúng tôi bao gồm một phần tử `<geolocation>` và hai phần tử {{htmlelement("p")}}, một để xuất thông báo trạng thái quyền vào, và một để xuất dữ liệu vị trí vào.

```html
<geolocation>
  Your browser doesn't support the <code>&lt;geolocation&gt;</code> element.
</geolocation>
<p id="status"></p>
<p id="output"></p>
```

#### JavaScript

Trong JavaScript của chúng tôi, trước tiên chúng tôi lấy tham chiếu đến cả ba phần tử HTML:

```js
const statusElem = document.querySelector("#status");
const outputElem = document.querySelector("#output");
const geo = document.querySelector("geolocation");
```

Tiếp theo, chúng tôi bao gồm cấu trúc `if...else if` kiểm tra `initialPermissionStatus` là gì và in thông báo trạng thái ra màn hình để thông báo cho người dùng biết trạng thái là gì, họ cần làm gì để sử dụng ứng dụng, và nút sẽ làm gì khi nhấn.

```js
if (geo.initialPermissionStatus === "prompt") {
  statusElem.textContent =
    "Please press the button to allow access to your location data and start requesting it.";
} else if (geo.initialPermissionStatus === "denied") {
  statusElem.textContent =
    "Permission previously denied. Please press the button to allow access to your location data and start requesting it.";
} else if (geo.initialPermissionStatus === "granted") {
  statusElem.textContent =
    "Permission previously granted. Please press the button to start requesting location data.";
}
```

Cuối cùng, chúng tôi thêm trình lắng nghe sự kiện {{domxref("HTMLGeolocationElement.location_event", "location")}} vào đối tượng `HTMLGeolocationElement`, để phát hiện khi yêu cầu dữ liệu vị trí được trả về. Nếu dữ liệu được trả về thành công, chúng tôi truy cập nó thông qua thuộc tính {{domxref("HTMLGeolocationElement.position")}} và in các giá trị vĩ độ và kinh độ vào đoạn đầu ra. Nếu yêu cầu dữ liệu thất bại, chúng tôi truy cập lỗi thông qua thuộc tính {{domxref("HTMLGeolocationElement.error")}} và in nó vào đoạn đầu ra.

```js
geo.addEventListener("location", () => {
  statusElem.textContent = "Data requested";
  if (geo.position) {
    outputElem.textContent += `(${geo.position.coords.latitude},${geo.position.coords.longitude}), `;
  } else if (geo.error) {
    outputElem.textContent += `${geo.error.message}, `;
  }
});
```

#### Kết quả

Xem ví dụ [chạy trực tiếp](https://mdn.github.io/dom-examples/geolocation-element/initial-permission-status/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/initial-permission-status)). Hãy thử chọn nút `<geolocation>` nhiều lần, chọn một tùy chọn khác nhau từ hộp thoại kết quả mỗi lần và tải lại trang, để xem cách thông báo đầu ra thay đổi để phản ánh tình huống.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
