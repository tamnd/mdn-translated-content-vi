---
title: "Range: thuộc tính commonAncestorContainer"
short-title: commonAncestorContainer
slug: Web/API/Range/commonAncestorContainer
page-type: web-api-instance-property
browser-compat: api.Range.commonAncestorContainer
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`Range.commonAncestorContainer`** trả về {{domxref("Node")}} sâu nhất, tức nằm thấp nhất trong cây tài liệu, chứa cả hai [điểm biên](https://dom.spec.whatwg.org/#introduction-to-dom-ranges) của `Range`. Điều này có nghĩa là nếu {{domxref("AbstractRange.startContainer", "startContainer")}} và {{domxref("AbstractRange.endContainer", "endContainer")}} cùng trỏ tới một nút, thì nút đó là **common ancestor container**.

Vì một `Range` không nhất thiết phải liên tục, và cũng có thể chỉ chọn một phần các nút, đây là một cách tiện dụng để tìm một `Node` bao quanh `Range`.

Thuộc tính này chỉ đọc. Để thay đổi ancestor container của một `Node`, hãy cân nhắc dùng các phương thức khác nhau để đặt vị trí bắt đầu và kết thúc của `Range`, chẳng hạn {{domxref("Range.setStart()")}} và {{domxref("Range.setEnd()")}}.

## Giá trị

Một đối tượng {{domxref("Node")}}.

## Ví dụ

Trong ví dụ này, chúng ta tạo một trình nghe sự kiện để xử lý các sự kiện {{domxref("Element/pointerup_event", "pointerup")}} trên một danh sách. Trình nghe lấy các ancestor chung của từng phần văn bản được chọn và kích hoạt một animation để làm nổi bật chúng.

### HTML

```html
<ul>
  <li>
    Strings
    <ul>
      <li>Cello</li>
      <li>
        Violin
        <ul>
          <li>First Chair</li>
          <li>Second Chair</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    Woodwinds
    <ul>
      <li>Clarinet</li>
      <li>Oboe</li>
    </ul>
  </li>
</ul>
```

### CSS

Lớp `.highlight` được tạo bên dưới sử dụng một tập hợp CSS {{cssxref("@keyframes")}} để tạo hiệu ứng viền mờ dần.

```css
.highlight {
  animation: highlight linear 1s;
}

@keyframes highlight {
  from {
    outline: 1px solid red;
  }
  to {
    outline: 1px solid transparent;
  }
}
```

```css hidden
body {
  padding: 1px;
}
```

### JavaScript

```js
document.addEventListener("pointerup", (e) => {
  const selection = window.getSelection();

  if (selection.type === "Range") {
    for (let i = 0; i < selection.rangeCount; i++) {
      const range = selection.getRangeAt(i);
      playAnimation(range.commonAncestorContainer);
    }
  }
});

function playAnimation(el) {
  if (el.nodeType === Node.TEXT_NODE) {
    el = el.parentNode;
  }

  el.classList.remove("highlight");
  setTimeout(() => {
    el.classList.add("highlight");
  }, 0);
}
```

### Kết quả

{{EmbedLiveSample("Examples", 700, 190)}}

## Thông số kỹ thuật

{{Specifications}}
