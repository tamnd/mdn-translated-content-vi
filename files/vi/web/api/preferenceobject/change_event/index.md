---
title: "PreferenceObject: sự kiện change"
short-title: change
slug: Web/API/PreferenceObject/change_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.PreferenceObject.change_event
spec-urls: https://drafts.csswg.org/mediaqueries-5/#onchange-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`change`** của giao diện {{domxref("PreferenceObject")}} được kích hoạt khi giá trị {{domxref("PreferenceObject.override", "override")}} của `PreferenceObject` thay đổi. Điều này có thể xảy ra do các lời gọi phương thức {{domxref("PreferenceObject.requestOverride", "requestOverride")}} hoặc {{domxref("PreferenceObject.clearOverride", "clearOverride")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Sử dụng cơ bản

Đoạn mã sau ghi lại giao diện màu ưa thích của người dùng vào console khi nó thay đổi.

```js
navigator.preferences.colorScheme.addEventListener("change", (event) => {
  console.log(navigator.preferences.colorScheme.value);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
