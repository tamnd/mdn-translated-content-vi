---
title: "UIEvent: sourceCapabilities property"
short-title: sourceCapabilities
slug: Web/API/UIEvent/sourceCapabilities
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.UIEvent.sourceCapabilities
---

{{APIRef("Input Device Capabilities API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`sourceCapabilities`** của giao diện {{domxref("UIEvent")}} trả về một phiên bản của giao diện {{domxref('InputDeviceCapabilities')}} cung cấp thông tin về thiết bị vật lý chịu trách nhiệm tạo ra sự kiện cảm ứng. Nếu không có thiết bị đầu vào nào chịu trách nhiệm cho sự kiện, nó trả về `null`.

Khi một tương tác người dùng đơn lẻ với thiết bị đầu vào tạo ra một loạt các sự kiện đầu vào khác nhau, thuộc tính `sourceCapabilities` của tất cả chúng sẽ trỏ đến cùng một phiên bản `InputDeviceCapabilities`. Ví dụ, khi người dùng nhấc ngón tay khỏi màn hình cảm ứng, một số UIEvent có thể được tạo ra bao gồm `touchend`, `mousedown`, `click` và `focus`. Tất cả những sự kiện này phải có cùng `sourceCapabilities` đại diện cho màn hình cảm ứng.

Thiết bị chỉ được coi là "chịu trách nhiệm" cho một sự kiện khi tương tác đó là một phần của abstraction được cung cấp bởi nền tảng web. Ví dụ, nhiều tác nhân người dùng cho phép thay đổi kích thước cửa sổ bằng chuột hoặc bàn phím, nhưng chi tiết này không được hiển thị cho nền tảng web theo bất kỳ cách nào, và do đó sourceCapabilities của sự kiện thay đổi kích thước thường là null.

## Giá trị

Một phiên bản của {{domxref('InputDeviceCapabilities')}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
