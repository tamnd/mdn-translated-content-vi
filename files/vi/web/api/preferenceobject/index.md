---
title: PreferenceObject
slug: Web/API/PreferenceObject
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PreferenceObject
spec-urls: https://drafts.csswg.org/mediaqueries-5/#preference-object-interface
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`PreferenceObject`** của [User Preferences API](/en-US/docs/Web/API/User_Preferences_API) cung cấp các thuộc tính và phương thức để đọc và ghi đè tùy chọn người dùng.

Sử dụng {{domxref("PreferenceManager")}} của tài liệu (truy cập qua {{domxref("Navigator.preferences")}}) để truy cập các đối tượng `PreferenceObject` đại diện cho mỗi tùy chọn có sẵn.

Giao diện `PreferenceManager` kế thừa từ {{domxref("EventTarget")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PreferenceObject.override")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Giá trị ghi đè nếu được đặt, hoặc `null` nếu không.
- {{domxref("PreferenceObject.value")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Giá trị ghi đè nếu được đặt, hoặc giá trị mặc định của UA nếu không.
- {{domxref("PreferenceObject.validValues")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Các giá trị hợp lệ cho phần ghi đè.

## Phương thức phiên bản

- {{domxref("PreferenceObject.clearOverride()")}} {{Experimental_Inline}}
  - : Đặt lại bất kỳ giá trị ghi đè nào đã được đặt trước đó về `null` và kích hoạt sự kiện {{domxref("PreferenceObject.change_event" "change")}}.
- {{domxref("PreferenceObject.requestOverride()")}} {{Experimental_Inline}}
  - : Yêu cầu ghi đè tùy chọn và kích hoạt sự kiện {{domxref("PreferenceObject.change_event" "change")}} khi thành công.

## Sự kiện

- {{domxref("PreferenceObject.change_event", "change")}} {{Experimental_Inline}}
  - : Được kích hoạt khi giá trị ghi đè được đặt hoặc đặt lại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
