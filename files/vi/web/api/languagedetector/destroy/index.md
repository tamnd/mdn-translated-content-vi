---
title: "LanguageDetector: phương thức destroy()"
short-title: destroy()
slug: Web/API/LanguageDetector/destroy
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.LanguageDetector.destroy
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`destroy()`** của giao diện {{domxref("LanguageDetector")}} giải phóng các tài nguyên được gán cho phiên bản `LanguageDetector` mà nó được gọi và dừng mọi hoạt động tiếp theo trên đó. Điều này có nghĩa là bất kỳ lệnh gọi phương thức đang diễn ra và tiếp theo được thực hiện trên `LanguageDetector` sẽ từ chối với `AbortError`.

Hợp lý khi hủy đối tượng `LanguageDetector` nếu chúng không còn được sử dụng, vì chúng chiếm đáng kể tài nguyên trong quá trình xử lý.

## Cú pháp

```js-nolint
destroy()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản `destroy()`

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});

// ...

detector.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
