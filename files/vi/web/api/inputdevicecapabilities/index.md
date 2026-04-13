---
title: InputDeviceCapabilities
slug: Web/API/InputDeviceCapabilities
page-type: web-api-interface
status:
  - experimental
browser-compat: api.InputDeviceCapabilities
---

{{APIRef("Input Device Capabilities API")}}{{SeeCompatTable}}

Giao diện **`InputDeviceCapabilities`** của {{domxref("InputDeviceCapabilities API", "Input Device Capabilities API", "", "nocode")}} cung cấp thông tin về thiết bị vật lý hoặc một nhóm thiết bị liên quan chịu trách nhiệm tạo ra các sự kiện đầu vào. Các sự kiện được gây ra bởi cùng một thiết bị đầu vào vật lý sẽ nhận được cùng một phiên bản đối tượng này, nhưng điều ngược lại không đúng. Ví dụ, hai chuột có cùng khả năng trong một hệ thống có thể được biểu diễn như một phiên bản `InputDeviceCapabilities` duy nhất.

Trong một số trường hợp, `InputDeviceCapabilities` đại diện cho khả năng của các thiết bị logic thay vì thiết bị vật lý. Điều này cho phép, ví dụ, bàn phím màn hình cảm ứng và bàn phím vật lý được biểu diễn theo cùng một cách khi chúng tạo ra cùng một đầu vào.

## Hàm khởi tạo

- {{domxref("InputDeviceCapabilities.InputDeviceCapabilities", "InputDeviceCapabilities()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `InputDeviceCapabilities`.

## Thuộc tính phiên bản

- {{DOMxRef("InputDeviceCapabilities.firesTouchEvents")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{JSxRef("Boolean")}} cho biết thiết bị có gửi sự kiện cảm ứng không.

## Phương thức phiên bản

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
