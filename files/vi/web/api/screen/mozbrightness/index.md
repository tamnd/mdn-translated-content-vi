---
title: "Screen: thuộc tính mozBrightness"
short-title: mozBrightness
slug: Web/API/Screen/mozBrightness
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Screen.mozBrightness
---

{{APIRef("CSSOM view API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Chỉ ra độ sáng của đèn nền màn hình, trên thang đo từ 0 (rất tối) đến 1 (độ sáng tối đa); giá trị này là một số thực double-precision.

Bạn có thể đọc và ghi thuộc tính này ngay cả khi màn hình bị tắt, nhưng đèn nền sẽ tắt trong khi màn hình bị vô hiệu hóa. Nếu bạn ghi giá trị X vào thuộc tính này, thuộc tính có thể không có cùng giá trị X khi bạn đọc lại sau đó. Hầu hết các màn hình không hỗ trợ nhiều mức độ sáng khác nhau như số lượng số double giữa 0 và 1. Độ chính xác của giá trị có thể bị giảm trước khi lưu trữ.

## Giá trị

Một số.

## Đặc tả kỹ thuật

Không phải là một phần của đặc tả kỹ thuật.

## Tương thích trình duyệt

{{Compat}}
