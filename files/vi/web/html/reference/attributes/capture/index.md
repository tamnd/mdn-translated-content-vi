---
title: "HTML attribute: capture"
short-title: capture
slug: Web/HTML/Reference/Attributes/capture
page-type: html-attribute
browser-compat: html.elements.input.capture
sidebar: htmlsidebar
---

Thuộc tính **`capture`** chỉ định rằng, tùy chọn, một tệp mới nên được chụp, và thiết bị nào nên được sử dụng để chụp phương tiện mới đó của loại được xác định bởi thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Attributes/accept).

Các giá trị bao gồm `user` và `environment`. Thuộc tính capture được hỗ trợ trên kiểu input {{HTMLElement("input/file", "file")}}.

Thuộc tính `capture` nhận giá trị là một chuỗi chỉ định máy ảnh nào để sử dụng để chụp dữ liệu hình ảnh hoặc video, nếu thuộc tính [accept](/en-US/docs/Web/HTML/Reference/Attributes/accept) cho biết rằng input nên thuộc một trong những loại đó.

| Giá trị       | Mô tả                                                      |
| ------------- | ---------------------------------------------------------- |
| `user`        | Nên sử dụng camera và/hoặc microphone hướng về phía người dùng.   |
| `environment` | Nên sử dụng camera và/hoặc microphone hướng ra ngoài. |

> [!NOTE]
> Capture trước đây là một thuộc tính Boolean mà nếu có, yêu cầu sử dụng thiết bị chụp phương tiện của thiết bị như camera hoặc microphone thay vì yêu cầu input tệp.

{{InteractiveExample("HTML Demo: capture", "tabbed-standard")}}

```html interactive-example
<label for="selfie">Take a picture of your face:</label>

<input type="file" id="selfie" name="selfie" accept="image/*" capture="user" />

<label for="picture">Take a picture using back facing camera:</label>

<input
  type="file"
  id="picture"
  name="picture"
  accept="image/*"
  capture="environment" />
```

```css interactive-example
label {
  display: block;
  margin-top: 1rem;
}

input {
  margin-bottom: 1rem;
}
```

## Ví dụ

Khi được đặt trên kiểu input tệp, các hệ điều hành có microphone và camera sẽ hiển thị giao diện người dùng cho phép chọn từ tệp hiện có hoặc tạo tệp mới.

```html
<p>
  <label for="soundFile">What does your voice sound like?:</label>
  <input type="file" id="soundFile" capture="user" accept="audio/*" />
</p>
<p>
  <label for="videoFile">Upload a video:</label>
  <input type="file" id="videoFile" capture="environment" accept="video/*" />
</p>
<p>
  <label for="imageFile">Upload a photo of yourself:</label>
  <input type="file" id="imageFile" capture="user" accept="image/*" />
</p>
```

{{EmbedLiveSample('Examples', '100%', 200)}}

Lưu ý rằng những cái này hoạt động tốt hơn trên thiết bị di động; nếu thiết bị của bạn là máy tính để bàn, bạn có thể sẽ nhận được bộ chọn tệp thông thường.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ các ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- [File API](/en-US/docs/Web/API/File)
- {{domxref('HTMLInputElement.files')}}
