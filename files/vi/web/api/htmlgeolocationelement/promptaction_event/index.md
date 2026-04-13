---
title: "HTMLGeolocationElement: sự kiện promptaction"
short-title: promptaction
slug: Web/API/HTMLGeolocationElement/promptaction_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.promptaction_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Sự kiện **`promptaction`** của giao diện {{domxref("HTMLGeolocationElement")}} được kích hoạt mỗi khi người dùng kích hoạt phần tử `<geolocation>` và chọn một tùy chọn từ hộp thoại kết quả, hoặc để cấp hoặc từ chối quyền `geolocation`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("promptaction", (event) => { })

onpromptaction = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Ví dụ

### Sử dụng `promptaction` để phản hồi lựa chọn quyền của người dùng

Trong [bản demo Bản đồ nhúng](https://mdn.github.io/dom-examples/geolocation-element/embedded-map/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/embedded-map)) của chúng tôi, chúng tôi sử dụng trình xử lý sự kiện `promptaction` để phản hồi người dùng đưa ra lựa chọn trong lời nhắc quyền `<geolocation>`:

```js
geo.addEventListener("promptaction", notifyUserGrantPermission);
```

Trong hàm `notifyUserGrantPermission()`, chúng tôi sử dụng thuộc tính {{domxref("HTMLGeolocationElement.permissionStatus")}} để kiểm tra xem trạng thái quyền có phải là `denied` hoặc `prompt` không và nếu vậy, chúng tôi yêu cầu người dùng nhấn nút lần nữa và cho phép vị trí. Chúng tôi không cần hỏi điều này nếu họ đã cấp quyền.

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
