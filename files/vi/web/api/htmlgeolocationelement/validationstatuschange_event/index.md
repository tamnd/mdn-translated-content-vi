---
title: "HTMLGeolocationElement: sự kiện validationstatuschange"
short-title: validationstatuschange
slug: Web/API/HTMLGeolocationElement/validationstatuschange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.validationstatuschange_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Sự kiện **`validationstatuschange`** của giao diện {{domxref("HTMLGeolocationElement")}} được kích hoạt mỗi khi giá trị {{domxref("HTMLGeolocationElement.isValid", "isValid")}} của phần tử {{htmlelement("geolocation")}} thay đổi.

Điều này xảy ra do một [bộ chặn](/en-US/docs/Web/HTML/Reference/Elements/geolocation#geolocation_blocking) được thêm vào hoặc xóa khỏi phần tử `<geolocation>`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("validationstatuschange", (event) => { })

onvalidationstatuschange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Ví dụ

### Sử dụng `validationstatuschange` để báo cáo lý do không hợp lệ

Trong [bản demo Khám phá lý do không hợp lệ](https://mdn.github.io/dom-examples/geolocation-element/exploring-invalid-reasons/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/exploring-invalid-reasons)) của chúng tôi, chúng tôi sử dụng trình xử lý sự kiện `validationstatuschange` để báo cáo khi phần tử `<geolocation>` trở nên hợp lệ, và báo cáo lý do không hợp lệ khi nó trở nên không hợp lệ:

```js
geo.addEventListener("validationstatuschange", () => {
  if (geo.isValid) {
    reasonElem.textContent = `<geolocation> is valid`;
  } else {
    reasonElem.textContent = `Invalid reason: ${geo.invalidReason}`;
  }
});
```

Mỗi khi trạng thái xác thực thay đổi, chúng tôi kiểm tra xem phần tử `<geolocation>` có hợp lệ không bằng cách sử dụng {{domxref("HTMLGeolocationElement.isValid")}}, và nếu có, in thông báo xác nhận điều này vào nội dung văn bản phần tử `<p>`. Nếu phần tử `<geolocation>` không hợp lệ, chúng tôi in {{domxref("HTMLGeolocationElement.invalidReason")}} vào nội dung văn bản phần tử `<p>`.

Xem trang {{domxref("HTMLGeolocationElement.invalidReason")}} để có hướng dẫn đầy đủ về ví dụ này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
