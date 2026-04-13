---
title: "WaveShaperNode: thuộc tính oversample"
short-title: oversample
slug: Web/API/WaveShaperNode/oversample
page-type: web-api-instance-property
browser-compat: api.WaveShaperNode.oversample
---

{{ APIRef("Web Audio API") }}

Thuộc tính `oversample` của giao diện {{ domxref("WaveShaperNode") }} là một giá trị liệt kê cho biết liệu có phải sử dụng oversampling hay không. Oversampling là kỹ thuật tạo nhiều mẫu hơn (up-sampling) trước khi áp dụng hiệu ứng méo cho tín hiệu âm thanh.

Sau khi áp dụng, số lượng mẫu được giảm về số lượng ban đầu. Điều này dẫn đến kết quả tốt hơn bằng cách tránh một số aliasing, nhưng đi kèm với chi phí là đường cong hình dạng độ chính xác thấp hơn.

Các giá trị `oversample` có thể là:

| Giá trị  | Hiệu ứng                                                      |
| -------- | ------------------------------------------------------------- |
| `'none'` | Không thực hiện oversampling.                                 |
| `'2x'`   | Nhân đôi số lượng mẫu trước khi áp dụng đường cong hình dạng. |
| `'4x'`   | Nhân 4 số lượng mẫu trước khi áp dụng đường cong hình dạng.   |

## Giá trị

Một trong `'none'`, `'2x'`, hoặc `'4x'`.

## Ví dụ

Xem [`BaseAudioContext.createWaveShaper()`](/en-US/docs/Web/API/BaseAudioContext/createWaveShaper#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
