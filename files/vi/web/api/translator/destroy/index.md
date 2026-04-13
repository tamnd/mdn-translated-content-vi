---
title: "Translator: destroy() method"
short-title: destroy()
slug: Web/API/Translator/destroy
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Translator.destroy
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}} {{securecontext_header}}

Phương thức **`destroy()`** của giao diện {{domxref("Translator")}} giải phóng các tài nguyên được phân bổ cho đối tượng `Translator` được gọi và dừng mọi hoạt động tiếp theo trên nó. Điều này có nghĩa là bất kỳ lời gọi phương thức đang diễn ra và tiếp theo trên `Translator` sẽ từ chối với `AbortError`.

Việc phá hủy các đối tượng `Translator` khi chúng không còn được sử dụng là hợp lý, vì chúng chiếm dụng các tài nguyên đáng kể trong quá trình xử lý.

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
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});

// ...

translator.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
