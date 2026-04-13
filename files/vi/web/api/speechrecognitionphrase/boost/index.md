---
title: "SpeechRecognitionPhrase: thuộc tính boost"
short-title: boost
slug: Web/API/SpeechRecognitionPhrase/boost
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SpeechRecognitionPhrase.boost
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`boost`** của giao diện {{domxref("SpeechRecognitionPhrase")}} trả về số thực đại diện cho trọng số bạn muốn áp dụng cho {{domxref("SpeechRecognitionPhrase.phrase", "phrase")}} tương ứng.

## Giá trị

Số thực từ `0.0` đến `10.0` (bao gồm) đại diện cho trọng số bạn muốn áp dụng cho `phrase`. Giá trị này xấp xỉ bằng logarithm tự nhiên của số lần nhiều hơn mà trang web cho rằng cụm từ này có khả năng xuất hiện so với những gì mô hình nhận dạng giọng nói biết. Giá trị càng cao, `phrase` càng có khả năng được nhận dạng.

Giá trị cao như `9.0` hoặc `10.0` có thể khiến engine nhận dạng nhầm lẫn nhận dạng các cụm từ khác là cụm từ được chỉ định. Do đó, các giá trị như vậy nên được sử dụng hiếm khi.

## Ví dụ

### Sử dụng cơ bản

Thuộc tính {{domxref("SpeechRecognition.phrases")}} chứa mảng các đối tượng `SpeechRecognitionPhrase` đại diện cho các cụm từ biasing theo ngữ cảnh. Mảng này có thể được sửa đổi giống như mảng JavaScript thông thường, ví dụ bằng cách đẩy các cụm từ mới vào động:

```js
recognition.phrases.push(new SpeechRecognitionPhrase("thistle", 5.0));
```

Sau đó bạn có thể truy cập các đối tượng này và thuộc tính của chúng như thế này. Để trả về giá trị `boost` của cụm từ đã thêm, bạn có thể làm như vậy:

```js
// Nên trả về 5.0
recognition.phrases[0].boost;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
