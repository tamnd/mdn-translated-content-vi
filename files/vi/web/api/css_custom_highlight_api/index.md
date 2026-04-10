---
title: CSS Custom Highlight API
slug: Web/API/CSS_Custom_Highlight_API
page-type: web-api-overview
browser-compat:
  - api.Highlight
  - api.HighlightRegistry
  - css.selectors.highlight
spec-urls: https://drafts.csswg.org/css-highlight-api-1/
---

{{DefaultAPISidebar("CSS Custom Highlight API")}}

CSS Custom Highlight API cung cấp một cơ chế để tạo kiểu cho các phạm vi văn bản tùy ý trong tài liệu bằng cách dùng JavaScript để tạo các phạm vi và CSS để tạo kiểu cho chúng.

## Khái niệm và cách sử dụng

Việc tạo kiểu cho các phạm vi văn bản trên một trang web có thể rất hữu ích. Ví dụ, các ứng dụng web chỉnh sửa văn bản có thể highlight lỗi chính tả hoặc ngữ pháp, và các trình soạn thảo mã có thể highlight lỗi cú pháp.

CSS Custom Highlight API mở rộng khái niệm của các pseudo-element highlight khác như {{cssxref('::selection')}}, {{cssxref('::spelling-error')}}, {{cssxref('::grammar-error')}}, và {{cssxref('::target-text')}} bằng cách cung cấp một cách tạo và tạo kiểu cho các đối tượng {{domxref('Range')}} tùy ý, thay vì bị giới hạn ở các phạm vi do trình duyệt định nghĩa.

Khi dùng CSS Custom Highlight API, bạn có thể tạo các phạm vi văn bản theo cách lập trình và highlight chúng mà không ảnh hưởng đến cấu trúc DOM của trang.

Có bốn bước để tạo kiểu cho các phạm vi văn bản trên một trang web bằng CSS Custom Highlight API:

1. Tạo các đối tượng {{domxref("Range")}}.
2. Tạo các đối tượng {{domxref("Highlight")}} cho các phạm vi này.
3. Đăng ký các highlight bằng {{domxref("HighlightRegistry")}}.
4. Tạo kiểu cho các highlight bằng pseudo-element {{cssxref("::highlight", "::highlight()")}}.

### Tạo các phạm vi

Bước đầu tiên là xác định các phạm vi văn bản mà bạn muốn tạo kiểu bằng cách tạo các đối tượng {{domxref("Range")}} trong JavaScript. Ví dụ:

```js
const parentNode = document.getElementById("foo");

const range1 = new Range();
range1.setStart(parentNode, 10);
range1.setEnd(parentNode, 20);

const range2 = new Range();
range2.setStart(parentNode, 40);
range2.setEnd(parentNode, 60);
```

### Tạo các highlight

Bước thứ hai là khởi tạo các đối tượng {{domxref("Highlight")}} cho các phạm vi văn bản của bạn.

Nhiều phạm vi có thể được gắn với một highlight. Nếu bạn muốn highlight nhiều đoạn văn bản theo cùng một cách, bạn cần tạo một highlight duy nhất và khởi tạo nó với các phạm vi tương ứng.

```js
const highlight = new Highlight(range1, range2);
```

Tuy nhiên, bạn cũng có thể tạo bao nhiêu highlight tùy ý. Ví dụ, nếu bạn đang xây dựng một trình soạn thảo văn bản cộng tác mà mỗi người dùng có một màu văn bản khác nhau, thì bạn có thể tạo một highlight cho mỗi người dùng, như trong đoạn mã dưới đây:

```js
const user1Highlight = new Highlight(user1Range1, user1Range2);
const user2Highlight = new Highlight(user2Range1, user2Range2, user2Range3);
```

Mỗi highlight có thể được tạo kiểu khác nhau.

### Đăng ký các highlight

Sau khi các highlight được tạo, hãy đăng ký chúng bằng cách sử dụng {{domxref("HighlightRegistry")}} có sẵn dưới dạng {{domxref("CSS/highlights_static", "CSS.highlights")}}.

Registry này là một đối tượng giống {{jsxref("Map")}} dùng để đăng ký các highlight theo tên, như dưới đây:

```js
CSS.highlights.set("user-1-highlight", user1Highlight);
CSS.highlights.set("user-2-highlight", user2Highlight);
```

Trong đoạn mã trên, các chuỗi `user-1-highlight` và `user-2-highlight` là các mã định danh tùy chỉnh có thể được dùng trong CSS để áp dụng kiểu cho các highlight đã đăng ký.

Bạn có thể đăng ký bao nhiêu highlight tùy ý trong registry, cũng như xóa highlight và xóa sạch toàn bộ registry.

```js
// Remove a single highlight from the registry.
CSS.highlights.delete("user-1-highlight");

// Clear the registry.
CSS.highlights.clear();
```

### Tạo kiểu cho các highlight

Bước cuối cùng là tạo kiểu cho các highlight đã đăng ký. Việc này được thực hiện bằng pseudo-element {{cssxref("::highlight", "::highlight()")}}. Ví dụ, để tạo kiểu cho highlight `user-1-highlight` đã đăng ký ở bước trước:

```css
::highlight(user-1-highlight) {
  background-color: yellow;
  color: black;
}
```

## Giao diện

- {{domxref("Highlight")}}
  - : Giao diện này được dùng để biểu diễn một tập hợp các phạm vi cần được tạo kiểu trong một tài liệu.
- {{domxref("HighlightRegistry")}}
  - : Có thể truy cập qua {{domxref("CSS/highlights_static", "CSS.highlights")}}, đối tượng giống {{jsxref("Map")}} này được dùng để đăng ký các highlight với các mã định danh tùy chỉnh.

## Ví dụ

### Highlight kết quả tìm kiếm

Ví dụ này cho thấy cách dùng CSS Custom Highlight API để highlight kết quả tìm kiếm.

#### HTML

Đoạn mã HTML dưới đây định nghĩa một trường tìm kiếm và một bài viết chứa vài đoạn văn bản:

```html
<label>Search within text <input id="query" type="text" /></label>
<article>
  <p>
    Maxime debitis hic, delectus perspiciatis laborum molestiae labore,
    deleniti, quam consequatur iure veniam alias voluptas nisi quo. Dolorem
    eaque alias, quo vel quas repudiandae architecto deserunt quidem, sapiente
    laudantium nulla.
  </p>
  <p>
    Maiores odit molestias, necessitatibus doloremque dolor illum reprehenderit
    provident nostrum laboriosam iste, tempore perferendis! Ab porro neque esse
    voluptas libero necessitatibus fugiat, ex, minus atque deserunt veniam
    molestiae tempora? Vitae.
  </p>
  <p>
    Dolorum facilis voluptate eaque eius similique ducimus dignissimos assumenda
    quos architecto. Doloremque deleniti non exercitationem rerum quam alias
    harum, nisi obcaecati corporis temporibus vero sapiente voluptatum est
    quibusdam id ipsa.
  </p>
</article>
```

#### JavaScript

JavaScript được dùng để lắng nghe sự kiện `input` trên trường tìm kiếm. Khi sự kiện được kích hoạt, mã sẽ định vị các kết quả khớp cho văn bản nhập vào trong văn bản của bài viết. Sau đó, nó tạo các phạm vi cho các kết quả khớp, rồi dùng CSS Custom Highlight API để tạo và đăng ký một đối tượng highlight `search-results`:

```js
const query = document.getElementById("query");
const article = document.querySelector("article");

// Find all text nodes in the article. We'll search within
// these text nodes.
const treeWalker = document.createTreeWalker(article, NodeFilter.SHOW_TEXT);
const allTextNodes = [];
let currentNode = treeWalker.nextNode();
while (currentNode) {
  allTextNodes.push(currentNode);
  currentNode = treeWalker.nextNode();
}

// Listen to the input event to run the search.
query.addEventListener("input", () => {
  // If the CSS Custom Highlight API is not supported,
  // display a message and bail-out.
  if (!CSS.highlights) {
    article.textContent = "CSS Custom Highlight API not supported.";
    return;
  }

  // Clear the HighlightRegistry to remove the
  // previous search results.
  CSS.highlights.clear();

  // Clean-up the search query and bail-out if
  // if it's empty.
  const str = query.value.trim().toLowerCase();
  if (!str) {
    return;
  }

  // Iterate over all text nodes and find matches.
  const ranges = allTextNodes
    .map((el) => ({ el, text: el.textContent.toLowerCase() }))
    .map(({ text, el }) => {
      const indices = [];
      let startPos = 0;
      while (startPos < text.length) {
        const index = text.indexOf(str, startPos);
        if (index === -1) break;
        indices.push(index);
        startPos = index + str.length;
      }

      // Create a range object for each instance of
      // str we found in the text node.
      return indices.map((index) => {
        const range = new Range();
        range.setStart(el, index);
        range.setEnd(el, index + str.length);
        return range;
      });
    });

  // Create a Highlight object for the ranges.
  const searchResultsHighlight = new Highlight(...ranges.flat());

  // Register the Highlight object in the registry.
  CSS.highlights.set("search-results", searchResultsHighlight);
});
```

#### CSS

Cuối cùng, pseudo-element `::highlight()` được dùng trong CSS để tạo kiểu cho các highlight:

```css
::highlight(search-results) {
  background-color: #ff0066;
  color: white;
}
```

#### Kết quả

Kết quả được hiển thị bên dưới. Hãy nhập văn bản vào trường tìm kiếm để highlight các kết quả khớp trong bài viết:

{{ EmbedLiveSample('Highlighting search results', 700, 300) }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
- Thuộc tính HTML [`contentEditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable)
- CSS {{cssxref("pseudo-elements")}}
- Module [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API)
