---
title: "Document: thuộc tính fullscreenEnabled"
short-title: fullscreenEnabled
slug: Web/API/Document/fullscreenEnabled
page-type: web-api-instance-property
browser-compat: api.Document.fullscreenEnabled
---

{{APIRef("Fullscreen API")}}

Thuộc tính chỉ đọc **`fullscreenEnabled`** trên giao diện {{domxref("Document")}} cho biết liệu chế độ toàn màn hình có khả dụng hay không.

Chế độ toàn màn hình chỉ khả dụng cho một trang không có plug-in có cửa sổ trong bất kỳ tài liệu nào của nó, và nếu tất cả các phần tử {{HTMLElement("iframe")}} chứa tài liệu có thuộc tính [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen) được đặt.

Mặc dù thuộc tính này là chỉ đọc, nó sẽ không ném lỗi nếu bị sửa đổi (ngay cả trong strict mode); setter là một thao tác rỗng và sẽ bị bỏ qua.

## Giá trị

Một giá trị boolean là `true` nếu tài liệu và các phần tử bên trong có thể được đưa vào chế độ toàn màn hình bằng cách gọi {{domxref("Element.requestFullscreen()")}}. Nếu chế độ toàn màn hình không khả dụng, giá trị này là `false`.

## Ví dụ

Trong ví dụ này, trước khi cố gắng yêu cầu chế độ toàn màn hình cho một phần tử {{htmlElement("video")}}, giá trị của `fullscreenEnabled` được kiểm tra, để tránh thực hiện khi không khả dụng.

```js
function requestFullscreen() {
  if (document.fullscreenEnabled) {
    videoElement.requestFullscreen();
  } else {
    console.log("Trình duyệt của bạn hiện không thể sử dụng chế độ toàn màn hình");
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn sử dụng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)
- {{domxref("Element.requestFullscreen()")}}
- {{domxref("Document.exitFullscreen()")}}
- {{domxref("Document.fullscreenElement")}}
- {{cssxref(":fullscreen") }} và {{cssxref("::backdrop")}}
- Thuộc tính [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen) của {{HTMLElement("iframe")}}
