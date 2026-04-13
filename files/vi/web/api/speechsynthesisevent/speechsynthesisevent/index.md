---
title: "SpeechSynthesisEvent: SpeechSynthesisEvent() constructor"
short-title: SpeechSynthesisEvent()
slug: Web/API/SpeechSynthesisEvent/SpeechSynthesisEvent
page-type: web-api-constructor
browser-compat: api.SpeechSynthesisEvent.SpeechSynthesisEvent
---

{{APIRef("Web Speech API")}}

Hàm khởi tạo **`SpeechSynthesisEvent()`** tạo một đối tượng {{domxref("SpeechSynthesisEvent")}} mới.

> [!NOTE]
> Nhà phát triển web thường không cần gọi hàm khởi tạo này, vì trình duyệt tự tạo các đối tượng này khi kích hoạt sự kiện.

## Cú pháp

```js-nolint
new SpeechSynthesisEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và các trình duyệt đặt nó thành `start`, `end`, `error`, `pause`, `resume`, `mark`, hoặc `boundary`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có các thuộc tính sau:
    - `utterance`
      - : Một đối tượng {{domxref("SpeechSynthesisUtterance")}}, là yêu cầu đọc mà sự kiện được kích hoạt trên đó.
    - `charIndex` {{Optional_inline}}
      - : Vị trí chỉ mục của ký tự trong {{domxref("SpeechSynthesisUtterance.text")}} đang được nói khi sự kiện được kích hoạt. Giá trị mặc định là `0`.
    - `charLength` {{Optional_inline}}
      - : Số ký tự còn lại cần được nói sau ký tự tại vị trí {{DOMxRef("SpeechSynthesisEvent.charIndex", "charIndex")}}. Giá trị mặc định là `0`.
    - `elapsedTime` {{Optional_inline}}
      - : Thời gian đã trôi qua tính bằng giây, sau khi {{domxref("SpeechSynthesisUtterance.text")}} bắt đầu được nói, tại thời điểm sự kiện được kích hoạt. Giá trị mặc định là `0`.
    - `name` {{Optional_inline}}
      - : Tên liên kết với một số loại sự kiện: tên của điểm đánh dấu [SSML](https://www.w3.org/TR/speech-synthesis/#S3.3.2) được đạt tới trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.mark_event", "mark")}}, hoặc loại ranh giới được đạt tới trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.boundary_event", "boundary")}}. Mặc định là chuỗi rỗng (`""`).

### Giá trị trả về

Một đối tượng {{domxref("SpeechSynthesisEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SpeechSynthesisErrorEvent")}}
