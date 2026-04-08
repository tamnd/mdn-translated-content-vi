---
title: :picture-in-picture
slug: Web/CSS/Reference/Selectors/:picture-in-picture
page-type: css-pseudo-class
browser-compat: css.selectors.picture-in-picture
sidebar: cssref
---

Lớp giả **`:picture-in-picture`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)) khớp với phần tử hiện đang ở chế độ picture-in-picture.

## Cú pháp

```css
:picture-in-picture {
  /* ... */
}
```

## Ghi chú sử dụng

Lớp giả `:picture-in-picture` cho phép bạn cấu hình stylesheet để tự động điều chỉnh kích thước, kiểu dáng hoặc bố cục nội dung khi video chuyển đổi qua lại giữa chế độ picture-in-picture và chế độ hiển thị thông thường.

## Ví dụ

Trong ví dụ này, một video có bóng đổ hộp khi được hiển thị trong cửa sổ nổi.

### HTML

HTML của trang trông như sau:

```html
<h1>MDN Web Docs Demo: :picture-in-picture pseudo-class</h1>

<p>
  This demo uses the <code>:picture-in-picture</code> pseudo-class to
  automatically change the style of a video entirely using CSS.
</p>

<video id="pip-video"></video>
```

Phần tử {{HTMLElement("video")}} có ID `"pip-video"` sẽ thay đổi giữa việc có hoặc không có bóng đổ hộp màu đỏ, tùy thuộc vào việc nó có đang được hiển thị trong cửa sổ nổi picture-in-picture hay không.

### CSS

Phần quan trọng nằm ở CSS.

```css
:picture-in-picture {
  box-shadow: 0 0 0 5px red;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Picture-in-picture API](/en-US/docs/Web/API/Picture-in-Picture_API)
- {{DOMxRef("HTMLVideoElement.requestPictureInPicture()")}}
- {{DOMxRef("HTMLVideoElement.disablePictureInPicture")}}
- {{DOMxRef("Document.pictureInPictureEnabled")}}
- {{DOMxRef("Document.exitPictureInPicture()")}}
- {{DOMxRef("Document.pictureInPictureElement")}}
