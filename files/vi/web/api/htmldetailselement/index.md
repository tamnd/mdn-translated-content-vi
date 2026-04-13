---
title: HTMLDetailsElement
slug: Web/API/HTMLDetailsElement
page-type: web-api-interface
browser-compat:
  - api.HTMLDetailsElement
  - api.HTMLElement.toggle_event.details_elements
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLDetailsElement`** cung cấp các thuộc tính đặc biệt (ngoài giao diện {{domxref("HTMLElement")}} thông thường mà nó cũng có thông qua kế thừa) để thao tác các phần tử {{HTMLElement("details")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ thực thể cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLDetailsElement.name")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`name`](/en-US/docs/Web/HTML/Reference/Elements/details#name), cho phép bạn tạo nhóm các phần tử {{htmlelement("details")}} loại trừ lẫn nhau. Mở một trong các phần tử `<details>` được đặt tên trong nhóm này sẽ khiến các phần tử khác trong nhóm đóng lại.
- {{domxref("HTMLDetailsElement.open")}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`open`](/en-US/docs/Web/HTML/Reference/Elements/details#open), cho biết nội dung của phần tử (không tính {{HTMLElement("summary")}}) có được hiển thị cho người dùng không.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ thực thể cha, {{domxref("HTMLElement")}}._

## Sự kiện

_Kế thừa các sự kiện từ giao diện cha, {{DOMxRef("HTMLElement")}}._

## Ví dụ

### Ghi nhật ký các chương khi chúng được mở và đóng

Ví dụ này sử dụng sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} của `HTMLElement` để thêm và xóa các chương khỏi một sidebar nhật ký khi chúng được mở và đóng.

#### HTML

```html
<section id="summaries">
  <p>Chapter summaries:</p>
  <details id="ch1">
    <summary>Chapter I</summary>
    Philosophy reproves Boethius for the foolishness of his complaints against
    Fortune. Her very nature is caprice.
  </details>
  <details id="ch2">
    <summary>Chapter II</summary>
    Philosophy in Fortune's name replies to Boethius' reproaches, and proves
    that the gifts of Fortune are hers to give and to take away.
  </details>
  <details id="ch3">
    <summary>Chapter III</summary>
    Boethius falls back upon his present sense of misery. Philosophy reminds him
    of the brilliancy of his former fortunes.
  </details>
</section>
<aside id="log">
  <p>Open chapters:</p>
  <div data-id="ch1" hidden>I</div>
  <div data-id="ch2" hidden>II</div>
  <div data-id="ch3" hidden>III</div>
</aside>
```

#### CSS

```css
body {
  display: flex;
}

#log {
  flex-shrink: 0;
  padding-left: 3em;
}

#summaries {
  flex-grow: 1;
}
```

#### JavaScript

```js
function logItem(e) {
  console.log(e);
  const item = document.querySelector(`[data-id=${e.target.id}]`);
  item.toggleAttribute("hidden");
}

const chapters = document.querySelectorAll("details");
chapters.forEach((chapter) => {
  chapter.addEventListener("toggle", logItem);
});
```

#### Kết quả

{{EmbedLiveSample("Log chapters as they are opened and closed", 700, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("details")}}
