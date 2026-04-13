---
title: EncodedVideoChunk
slug: Web/API/EncodedVideoChunk
page-type: web-api-interface
browser-compat: api.EncodedVideoChunk
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`EncodedVideoChunk`** của {{domxref('WebCodecs API','','',' ')}} đại diện cho một chunk dữ liệu video đã mã hóa.

## Hàm khởi tạo

- {{domxref("EncodedVideoChunk.EncodedVideoChunk", "EncodedVideoChunk()")}}
  - : Tạo một đối tượng `EncodedVideoChunk` mới.

## Thuộc tính phiên bản

- {{domxref("EncodedVideoChunk.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết liệu chunk dữ liệu này có phải là key chunk hay không.
- {{domxref("EncodedVideoChunk.timestamp")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên đại diện cho timestamp của video tính bằng micro giây.
- {{domxref("EncodedVideoChunk.duration")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên đại diện cho thời lượng của video tính bằng micro giây.
- {{domxref("EncodedVideoChunk.byteLength")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên đại diện cho độ dài của video tính bằng byte.

## Phương thức phiên bản

- {{domxref("EncodedVideoChunk.copyTo()")}}
  - : Sao chép dữ liệu video đã mã hóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
