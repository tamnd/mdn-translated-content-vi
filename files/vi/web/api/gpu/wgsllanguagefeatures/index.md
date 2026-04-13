---
title: "GPU: thuộc tính wgslLanguageFeatures"
short-title: wgslLanguageFeatures
slug: Web/API/GPU/wgslLanguageFeatures
page-type: web-api-instance-property
browser-compat: api.GPU.wgslLanguageFeatures
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`wgslLanguageFeatures`** của giao diện {{domxref("GPU")}} trả về một đối tượng {{domxref("WGSLLanguageFeatures")}} báo cáo [các tiện ích ngôn ngữ WGSL](https://gpuweb.github.io/gpuweb/wgsl/#language-extension) được triển khai WebGPU hỗ trợ.

> [!NOTE]
> Không phải tất cả tiện ích ngôn ngữ WGSL đều có sẵn cho WebGPU trong mọi trình duyệt hỗ trợ API này. Chúng tôi khuyến nghị bạn kiểm thử kỹ mọi tiện ích mà bạn chọn dùng.

## Giá trị

Một thể hiện đối tượng {{domxref("WGSLLanguageFeatures")}}. Đây là một đối tượng [setlike](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set).

## Ví dụ

```js
if (!navigator.gpu) {
  throw Error("WebGPU not supported.");
}

const wgslFeatures = navigator.gpu.wgslLanguageFeatures;

// Trả về kích thước của tập hợp
console.log(wgslFeatures.size);

// Duyệt qua tất cả các giá trị của tập hợp bằng values()
const valueIterator = wgslFeatures.values();
for (const value of valueIterator) {
  console.log(value);
}

// …
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
