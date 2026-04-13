---
title: "Document: thuộc tính fullscreenElement"
short-title: fullscreenElement
slug: Web/API/Document/fullscreenElement
page-type: web-api-instance-property
browser-compat: api.Document.fullscreenElement
---

{{ApiRef("Fullscreen API")}}

Thuộc tính chỉ đọc **`Document.fullscreenElement`** trả về {{ domxref("Element") }} đang được trình bày ở chế độ toàn màn hình trong tài liệu này, hoặc `null` nếu chế độ toàn màn hình hiện không được sử dụng.

Mặc dù thuộc tính này là chỉ đọc, nó sẽ không ném lỗi nếu bị sửa đổi (ngay cả trong strict mode); setter là một thao tác rỗng và sẽ bị bỏ qua.

## Giá trị

Đối tượng {{domxref("Element")}} hiện đang ở chế độ toàn màn hình; nếu chế độ toàn màn hình hiện không được sử dụng bởi `document`, giá trị trả về là `null`. Nếu có nhiều phần tử ở chế độ toàn màn hình, phần tử trên cùng (yêu cầu gần nhất) được trả về.

## Ví dụ

Ví dụ này trình bày một hàm, `isVideoInFullscreen()`, kiểm tra giá trị trả về bởi `fullscreenElement`; nếu tài liệu đang ở chế độ toàn màn hình (`fullscreenElement` không phải `null`) và {{domxref("Node.nodeName", "nodeName")}} của phần tử toàn màn hình là `VIDEO`, cho biết một phần tử {{HTMLElement("video")}}, hàm trả về `true`, cho biết video đang ở chế độ toàn màn hình.

```js
function isVideoInFullscreen() {
  if (document.fullscreenElement?.nodeName === "VIDEO") {
    return true;
  }
  return false;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn sử dụng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)
- {{ domxref("Element.requestFullscreen()") }}
- {{ domxref("Document.exitFullscreen()") }}
- {{ cssxref(":fullscreen") }} và {{cssxref("::backdrop")}}
- Thuộc tính [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen) của {{HTMLElement("iframe")}}
