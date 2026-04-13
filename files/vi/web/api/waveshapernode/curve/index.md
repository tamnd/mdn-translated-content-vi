---
title: "WaveShaperNode: thuộc tính curve"
short-title: curve
slug: Web/API/WaveShaperNode/curve
page-type: web-api-instance-property
browser-compat: api.WaveShaperNode.curve
---

{{ APIRef("Web Audio API") }}

Thuộc tính `curve` của giao diện {{ domxref("WaveShaperNode") }} là một {{jsxref("Float32Array")}} chứa các số mô tả méo cần áp dụng.

Phần tử giữa của mảng được áp dụng cho bất kỳ giá trị tín hiệu nào là `0`, phần tử đầu tiên áp dụng cho giá trị tín hiệu `-1` và phần tử cuối cùng áp dụng cho giá trị tín hiệu `1`; các giá trị thấp hơn `-1` hoặc lớn hơn `1` được xử lý như `-1` hoặc `1` tương ứng.

Nếu cần thiết, các giá trị trung gian của đường cong méo được nội suy tuyến tính.

> [!NOTE]
> Mảng có thể là giá trị `null`: trong trường hợp đó, không có méo nào được áp dụng cho tín hiệu đầu vào.

## Giá trị

Một {{jsxref("Float32Array")}}.

## Ví dụ

Xem [`BaseAudioContext.createWaveShaper()`](/en-US/docs/Web/API/BaseAudioContext/createWaveShaper#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
