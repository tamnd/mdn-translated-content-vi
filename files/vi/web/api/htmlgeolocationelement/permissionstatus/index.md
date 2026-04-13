---
title: "HTMLGeolocationElement: thuộc tính permissionStatus"
short-title: permissionStatus
slug: Web/API/HTMLGeolocationElement/permissionStatus
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.permissionStatus
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`permissionStatus`** chỉ đọc của giao diện {{domxref("HTMLGeolocationElement")}} trả về một giá trị liệt kê đại diện cho trạng thái quyền hiện tại cho tính năng `geolocation`.

Nếu bạn muốn truy cập trạng thái quyền ban đầu cho tính năng `geolocation` như khi trang tải lần đầu, hãy sử dụng thuộc tính {{domxref("HTMLGeolocationElement.initialPermissionStatus", "initialPermissionStatus")}}.

## Giá trị

Một giá trị liệt kê, có thể là một trong:

- `granted`
  - : Người dùng đã cấp quyền cho trình duyệt sử dụng tính năng `geolocation`, thông qua phần tử {{htmlelement("geolocation")}} hoặc một số cơ chế khác. Khi sử dụng phần tử `<geolocation>`, điều này có nghĩa là người dùng đã nhấn nút được hiển thị và chọn tùy chọn "cho phép", tại đó trình duyệt sẽ bắt đầu yêu cầu dữ liệu vị trí.
- `denied`
  - : Người dùng đã từ chối quyền cho trình duyệt sử dụng tính năng `geolocation`, thông qua phần tử `<geolocation>` hoặc một số cơ chế khác. Khi sử dụng phần tử `<geolocation>`, điều này có nghĩa là người dùng đã nhấn nút được hiển thị và chọn tùy chọn "không cho phép", tại đó trình duyệt sẽ không yêu cầu dữ liệu vị trí cho đến khi người dùng nhấn nút được hiển thị lần nữa và chọn tùy chọn "cho phép".
- `prompt`
  - : Người dùng chưa cụ thể cấp hoặc từ chối quyền cho trình duyệt sử dụng tính năng `geolocation`, có nghĩa là trình duyệt sẽ không yêu cầu dữ liệu vị trí cho đến khi họ cấp quyền. Khi sử dụng phần tử `<geolocation>`, điều này có nghĩa là người dùng chưa nhấn nút được hiển thị. Khi họ làm vậy, họ sẽ được tùy chọn cấp hoặc từ chối quyền cho trình duyệt yêu cầu dữ liệu vị trí.

Trạng thái quyền tồn tại giữa các lần tải trang. Nếu phần tử `<geolocation>` có thuộc tính [`autolocate`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#autolocate) được đặt thành `true`, và quyền đã được cấp trước đó, trình duyệt sẽ bắt đầu yêu cầu dữ liệu vị trí ngay khi phần tử `<geolocation>` được hiển thị mà không cần người dùng nhấn nút.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation></geolocation>
```

```js
const geo = document.querySelector("geolocation");
console.log(geo.permissionStatus);
// "prompt" if this is the first time the user has accessed this page
```

### Sử dụng trạng thái quyền để thông báo cho người dùng

Trong ví dụ [Bản đồ nhúng](https://mdn.github.io/dom-examples/geolocation-element/embedded-map/) của chúng tôi ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/embedded-map)), chúng tôi thêm trình lắng nghe sự kiện {{domxref("HTMLGeolocationElement.promptaction_event", "promptaction")}} vào đối tượng `HTMLGeolocationElement` đại diện cho phần tử `<geolocation>` của chúng tôi.

```js
geo.addEventListener("promptaction", notifyUserGrantPermission);
```

Trong hàm `notifyUserGrantPermission()` được tham chiếu, chúng tôi sử dụng thuộc tính `permissionStatus` để kiểm tra xem trạng thái quyền có phải là `denied` hoặc `prompt` không và nếu vậy, chúng tôi yêu cầu người dùng nhấn nút lần nữa và cho phép vị trí. Chúng tôi không cần hỏi điều này nếu họ cấp quyền.

```js
function notifyUserGrantPermission() {
  if (geo.permissionStatus === "denied" || geo.permissionStatus === "prompt") {
    statusElem.textContent =
      'Please press the "Use location" button again and allow location for this site.';
  }
}
```

Xem trang chính {{domxref("HTMLGeolocationElement")}} để có hướng dẫn đầy đủ về ví dụ này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
