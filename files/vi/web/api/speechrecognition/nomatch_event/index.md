---
title: "SpeechRecognition: Sự kiện nomatch"
short-title: nomatch
slug: Web/API/SpeechRecognition/nomatch_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.nomatch_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`nomatch`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi dịch vụ nhận dạng giọng nói trả về kết quả cuối cùng nhưng không có nhận dạng đáng kể.

Điều này có thể bao gồm một mức độ nhận dạng nào đó, nhưng không đạt hoặc vượt ngưỡng {{domxref("SpeechRecognitionAlternative.confidence","confidence")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("nomatch", (event) => { })

onnomatch = (event) => { }
```

## Loại sự kiện

Một {{domxref("SpeechRecognitionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SpeechRecognitionEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng khả dụng._

- {{domxref("SpeechRecognitionEvent.emma")}} {{ReadOnlyInline}}
  - : Trả về biểu diễn bằng ngôn ngữ đánh dấu chú thích đa phương tiện mở rộng (EMMA) — XML — của kết quả.
- {{domxref("SpeechRecognitionEvent.interpretation")}} {{ReadOnlyInline}}
  - : Trả về ý nghĩa ngữ nghĩa của những gì người dùng đã nói.
- {{domxref("SpeechRecognitionEvent.resultIndex")}} {{ReadOnlyInline}}
  - : Trả về giá trị chỉ mục thấp nhất trong "mảng" {{domxref("SpeechRecognitionResultList")}} đã thực sự thay đổi.
- {{domxref("SpeechRecognitionEvent.results")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SpeechRecognitionResultList")}} biểu diễn tất cả các kết quả nhận dạng giọng nói cho phiên hiện tại.

## Ví dụ

Bạn có thể sử dụng sự kiện `nomatch` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("nomatch", () => {
  console.error("Speech not recognized");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onnomatch`:

```js
recognition.onnomatch = () => {
  console.error("Speech not recognized");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
