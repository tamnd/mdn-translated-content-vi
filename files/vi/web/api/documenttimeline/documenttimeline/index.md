---
title: "DocumentTimeline: DocumentTimeline() constructor"
short-title: DocumentTimeline()
slug: Web/API/DocumentTimeline/DocumentTimeline
page-type: web-api-constructor
browser-compat: api.DocumentTimeline.DocumentTimeline
---

{{ APIRef("Web Animations") }}

Hàm khởi tạo **`DocumentTimeline()`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) tạo đối tượng {{domxref("DocumentTimeline")}} mới liên kết với tài liệu đang hoạt động của ngữ cảnh duyệt web hiện tại.

## Cú pháp

```js-nolint
new DocumentTimeline(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Đối tượng chỉ định các tùy chọn cho timeline mới. Các thuộc tính sau có sẵn:
    - `originTime` {{optional_inline}}
      - : Số `number` chỉ định thời gian không của {{domxref("DocumentTimeline")}} dưới dạng số mili giây tương đối so với {{domxref("Performance.timeOrigin")}}. Mặc định là `0`.

## Ví dụ

### Thời gian gốc

{{domxref("DocumentTimeline")}} với `originTime` bằng không đếm thời gian bắt đầu từ {{domxref("Performance.timeOrigin")}}. Đây là hành vi tương tự như {{domxref("Document.timeline")}}.

```js
const timeline = new DocumentTimeline();
console.log(timeline.currentTime === document.timeline.currentTime); // true
```

Đặt `originTime` khác không sẽ bù đắp {{domxref("DocumentTimeline")}} so với {{domxref("Document.timeline")}} theo lượng đó:

```js
const offsetTimeline = new DocumentTimeline({ originTime: 500 });
console.log(document.timeline.currentTime - offsetTimeline.currentTime); // 500
```

{{domxref("DocumentTimeline")}} tương đối so với thời điểm hiện tại có thể được xây dựng bằng:

```js
const nowTimeline = new DocumentTimeline({
  originTime: document.timeline.currentTime,
});
console.log(nowTimeline.currentTime); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationTimeline")}}
- {{domxref("DocumentTimeline")}}
