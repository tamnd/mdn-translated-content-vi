---
title: "HTMLMediaElement: thuộc tính preload"
short-title: preload
slug: Web/API/HTMLMediaElement/preload
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.preload
---

{{APIRef("HTML DOM")}}

Thuộc tính **`preload`** của giao diện {{domxref("HTMLMediaElement")}} là một chuỗi cung cấp gợi ý cho trình duyệt về những gì tác giả cho rằng sẽ mang lại trải nghiệm tốt nhất cho người dùng.

Nó phản ánh thuộc tính `preload` của phần tử {{HTMLElement("audio")}} và phần tử {{HTMLElement("video")}}.

## Giá trị

Một sợi dây. Các giá trị có thể có như sau:

- `none`
- : Cho biết không nên tải trước phương tiện.
- `metadata`
- : Cho biết chỉ tìm nạp siêu dữ liệu phương tiện (ví dụ: độ dài).
- `auto`
- : Cho biết rằng toàn bộ tệp phương tiện có thể được tải xuống, ngay cả khi người dùng không mong muốn sử dụng nó.
- _chuỗi trống_
- : Từ đồng nghĩa của giá trị `auto`.

## Ví dụ

```html
<video
  id="el"
  controls
  src="https://example.com/media.mp4"
  poster="https://example.com/media.jpg"
  width="800"
  height="600"
  preload="metadata">
  Sorry, your browser doesn't support embedded videos, but don't worry, you can
  <a href="https://example.com/media.mp4" download="media.mp4">download it</a>
  and watch it with your favorite video player!
</video>
```

```js
const el = document.getElementById("el");
console.log(el.preload); // Output: "metadata"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
