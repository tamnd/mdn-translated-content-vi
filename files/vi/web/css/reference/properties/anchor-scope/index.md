---
title: anchor-scope
slug: Web/CSS/Reference/Properties/anchor-scope
page-type: css-property
browser-compat: css.properties.anchor-scope
sidebar: cssref
---

Thuộc tính **`anchor-scope`** [CSS](/en-US/docs/Web/CSS) có thể được sử dụng để giới hạn phạm vi mà trong đó phần tử được định vị có thể được liên kết với các phần tử neo tới một cây con cụ thể.

## Cú pháp

```css
/* Giá trị đơn */
anchor-scope: none;
anchor-scope: all;
anchor-scope: --anchor-name;

/* Nhiều giá trị <dashed-ident> */
anchor-scope: --anchor-name, --another-name;

/* Giá trị toàn cục */
anchor-scope: inherit;
anchor-scope: initial;
anchor-scope: revert;
anchor-scope: revert-layer;
anchor-scope: unset;
```

### Giá trị

- `none`
  - : Không có giới hạn phạm vi neo nào được áp dụng trên phần tử. Đây là giá trị mặc định.
- `all`
  - : Đặt phạm vi sao cho _bất kỳ_ giá trị `anchor-name` nào được đặt trong cây con chỉ có thể được liên kết bởi các phần tử được định vị trong cùng cây con.
- {{cssxref("dashed-ident", "&lt;dashed-ident&gt;#")}}
  - : Một hoặc nhiều {{cssxref("dashed-ident")}} được phân tách bằng dấu phẩy đại diện cho các tên neo. Đặt phạm vi sao cho các giá trị `anchor-name` được chỉ định, khi được đặt trong cây con, chỉ có thể được liên kết bởi các phần tử được định vị trong cùng cây con.

## Mô tả

Khi nhiều [phần tử neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#associating_anchor_and_positioned_elements) trên một trang được gán cùng giá trị {{cssxref("anchor-name")}} và phần tử được định vị được liên kết với tên neo đó (bằng cách chỉ định tên làm giá trị thuộc tính {{cssxref("position-anchor")}} của nó), phần tử được định vị sẽ được liên kết với phần tử neo _cuối cùng_ theo thứ tự nguồn có tên neo đó.

Điều này có thể gây ra vấn đề trong một số tình huống nhất định. Ví dụ, nếu một tài liệu chứa nhiều thành phần lặp lại, mỗi thành phần có một phần tử được định vị gắn kết với neo, tất cả các phần tử được định vị sẽ được neo vào neo cuối cùng trên trang, trừ khi mỗi thành phần sử dụng tên neo khác nhau. Đây có thể không phải là hành vi mong muốn.

Thuộc tính `anchor-scope` có thể khắc phục vấn đề này bằng cách giới hạn khả năng hiển thị, hay "phạm vi", của giá trị `anchor-name` đối với một cây con cụ thể. Kết quả là mỗi phần tử được định vị chỉ có thể được neo vào một phần tử trong cùng cây con của phần tử có phạm vi được đặt trên nó.

- `anchor-scope: all` đặt phạm vi sao cho _bất kỳ_ giá trị `anchor-name` nào được đặt trong cây con chỉ có thể được liên kết bởi các phần tử được định vị trong cùng cây con. Giả sử chúng ta bao gồm nhiều neo trong một tài liệu, tất cả đều có `anchor-name: --my-anchor` được đặt trên chúng, và đặt chúng trong các container riêng biệt. Sau đó chúng ta đặt `anchor-scope: all` trên mỗi container. Nếu sau đó chúng ta bao gồm một phần tử được định vị bên trong một trong các container và gán cho nó `--my-anchor` làm giá trị của thuộc tính `position-anchor`, nó sẽ được định vị tương đối với neo bên trong cùng container.

  Hơn nữa, nếu chúng ta tạo một phần tử được định vị khác bên ngoài các container và gán cho nó cùng tên neo, hoặc tên neo khác, nó sẽ không được định vị neo tương đối với bất kỳ neo nào, bất kể các neo có tên neo đó trong giá trị `anchor-name` của chúng hay không. `anchor-scope: all` giới hạn phạm vi neo cho các container mà nó được đặt trên đó đối với _bất kỳ_ neo nào, bất kể `anchor-name`, chỉ với các phần tử được định vị bên trong cùng container.

- `anchor-scope: <dashed-ident>#` đặt phạm vi sao cho các giá trị `anchor-name` được chỉ định, khi được đặt trong cây con, chỉ có thể được liên kết bởi các phần tử được định vị trong cùng cây con. Nếu chúng ta trở lại ví dụ tương tự được mô tả trong phần trước, nhưng thay đổi giá trị `anchor-scope` được đặt trên các container thành `--my-anchor`:
  - Các phần tử được định vị với `position-anchor: --my-anchor` được đặt trên chúng sẽ bị giới hạn trong phạm vi được áp đặt bởi cài đặt `anchor-scope`. Chúng chỉ được định vị tương đối với các neo nếu chúng được đặt bên trong các container.
  - Tuy nhiên, các phần tử được định vị với các tên `position-anchor` khác nhau — ví dụ, `--another-anchor` — _có thể_ được định vị tương đối với một trong các neo, dù nó được đặt bên trong hay bên ngoài các container, miễn là bạn thêm tên neo `--another-anchor` vào thuộc tính `anchor-name` của neo. Thuộc tính `anchor-scope` chỉ giới hạn phạm vi cho tên neo `--my-anchor`, vì vậy nó sẽ không ảnh hưởng đến các tên neo khác.

    Nếu nhiều neo được gán tên neo `--another-anchor`, các phần tử được định vị với giá trị `position-anchor` đó sẽ được định vị tương đối với neo cuối cùng theo thứ tự nguồn có tên đó.

- `anchor-scope: none` là giá trị mặc định, chỉ định rằng không có phạm vi neo nào được đặt. Nếu có nhiều neo trong một tài liệu có cùng `anchor-name`, và phần tử được định vị được gán tên này làm giá trị thuộc tính `position-anchor`, nó sẽ được định vị tương đối với phần tử neo cuối cùng theo thứ tự nguồn, bất kể nó được đặt ở đâu trong hệ thống phân cấp DOM.

Nếu bạn có, ví dụ, ba giá trị `anchor-name` được đặt trong một cây con (chẳng hạn, `--anchor1`, `--anchor2`, và `--anchor3`), việc đặt `anchor-scope: --anchor1, --anchor2, --anchor3` trên phần tử cấp cao nhất của cây con sẽ tương đương với việc đặt `anchor-scope: all`.

Phạm vi neo chỉ ảnh hưởng đến [liên kết neo tường minh](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#explicit_css_anchor_association), tức là những liên kết được tạo giữa phần tử neo có `anchor-name` được đặt trên nó và phần tử được định vị tham chiếu tên neo của phần tử neo trong giá trị `position-anchor`. Phạm vi neo không ảnh hưởng đến [liên kết neo ngầm định](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#implicit_anchor_association).

Để biết thêm thông tin về tính năng và cách sử dụng neo, hãy xem mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách phạm vi neo hoạt động ở mức cơ bản. Nó cho thấy cách một phần tử neo bên trong container có phạm vi có thể bị giới hạn chỉ liên kết với các phần tử được định vị trong cùng container có phạm vi.

#### HTML

Chúng ta chỉ định một phần tử {{htmlelement("section")}} mà chúng ta sẽ đặt phạm vi neo trên đó. Nó chứa hai phần tử {{htmlelement("div")}}, một để biến thành neo và một để là phần tử được định vị bằng neo.

Chúng ta cũng bao gồm `<div>` thứ ba bên ngoài `<section>`, mà chúng ta cũng sẽ biến thành phần tử được định vị bằng neo.

```html live-sample___basic-usage
<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 1</div>
</section>

<div class="positioned">Positioned 2</div>
```

#### CSS

Đầu tiên chúng ta đặt `anchor-scope: --my-anchor` trên `<section>`. Điều này giới hạn phạm vi của nó sao cho các phần tử neo con của `<section>` với tên `--my-anchor` chỉ có thể được liên kết bởi các phần tử được định vị cũng là con của `<section>`.

Để kiểm tra điều này, chúng ta khai báo `<div>` `anchor` là phần tử neo bằng cách đặt {{cssxref("anchor-name")}} là `--my-anchor` trên nó. Sau đó chúng ta định vị tuyệt đối các phần tử `.positioned`, gắn kết chúng với neo bằng cách đặt giá trị {{cssxref("position-anchor")}} của chúng thành `--my-anchor`, và định vị chúng ở bên phải của neo bằng cách đặt giá trị {{cssxref("position-area")}} của chúng thành `right`:

```css hidden live-sample___basic-usage
.scoped {
  padding: 20px;
  background: #eeeeee;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: blue;
  width: fit-content;
  padding: 3px;
}

.positioned {
  background: orange;
  width: fit-content;
  padding: 3px;
}
```

```css live-sample___basic-usage
.scoped {
  anchor-scope: --my-anchor;
}

.anchor {
  anchor-name: --my-anchor;
}

.positioned {
  position: absolute;
  position-anchor: --my-anchor;
  position-area: right;
}
```

#### Kết quả

Ví dụ hiển thị như sau:

{{ EmbedLiveSample("basic_usage", "100%", "225") }}

Lưu ý cách phần tử được định vị đầu tiên được đặt ở bên phải của neo. Nó nằm trong phạm vi để định vị tương đối với neo `--my-anchor`, vì nó nằm bên trong phần tử `<section>` nơi `anchor-scope: --my-anchor` được đặt.

Tuy nhiên, phần tử được định vị thứ hai không được định vị tương đối với neo. Nó không phải là con của phần tử `<section>`, vì vậy nó nằm ngoài phạm vi neo.

### So sánh các giá trị `anchor-scope` khác nhau

Ví dụ này minh họa tác động của các giá trị `anchor-scope` khác nhau bằng cách cho phép bạn áp dụng các giá trị `anchor-scope` khác nhau cho nhiều container, tất cả đều chứa neo có cùng giá trị `anchor-name`.

#### HTML

Chúng ta chỉ định ba phần tử {{htmlelement("section")}} mà chúng ta sẽ đặt phạm vi neo trên đó. Mỗi `<section>` chứa hai phần tử {{htmlelement("div")}}, một để biến thành neo và một để là phần tử được định vị bằng neo.

Chúng ta cũng bao gồm một `<div>` bổ sung bên ngoài các phần tử `<section>`, mà chúng ta cũng sẽ biến thành phần tử được định vị bằng neo. Phần tử này sẽ có cài đặt định vị neo khác với các phần tử còn lại.

Cuối cùng, chúng ta bao gồm một {{htmlelement("form")}} chứa ba phần tử [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio) khác nhau để cho phép đặt các giá trị `anchor-scope` khác nhau trên các phần tử `<section>`.

```html live-sample___comparing-values
<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 1</div>
</section>

<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 2</div>
</section>

<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 3</div>
</section>

<div class="positioned2">Positioned 4</div>

<form>
  <fieldset>
    <legend>Select an <code>anchor-scope</code> value</legend>

    <input type="radio" id="all" name="scope" value="all" checked />
    <label for="all"><code>all</code></label>
    <input type="radio" id="my-anchor" name="scope" value="--my-anchor" />
    <label for="my-anchor"><code>--my-anchor</code></label>
    <input type="radio" id="none" name="scope" value="none" />
    <label for="none"><code>none</code></label>
  </fieldset>
</form>
```

#### CSS

Chúng ta bắt đầu bằng cách chỉ định các phần tử neo là neo bằng cách gán cho chúng hai giá trị {{cssxref("anchor-name")}}: `--my-anchor` và `--another-anchor`.

```css hidden live-sample___comparing-values
body {
  display: flex;
  justify-content: center;
  gap: 50px;
  margin-top: 5px;
}

.scoped {
  padding: 20px;
  background: #eeeeee;
  border: 2px solid #dddddd;
  border-radius: 10px;
  width: 100px;
  height: 100px;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: blue;
  width: fit-content;
  padding: 3px;
}

.positioned,
.positioned2 {
  border: 1px solid black;
  border-radius: 3px;
  width: fit-content;
  padding: 3px 6px;
  box-shadow: 3px 3px 3px rgb(0 0 0 / 0.2);
}

form {
  position: absolute;
  bottom: 5px;
  right: 5px;
}
```

```css live-sample___comparing-values
.anchor {
  anchor-name: --my-anchor, --another-anchor;
}
```

Tiếp theo, chúng ta định vị các phần tử `.positioned` tương đối với phần tử neo. Chúng ta định vị tuyệt đối chúng, gán cho chúng giá trị {{cssxref("position-anchor")}} là `--my-anchor` để liên kết chúng với neo, và định vị chúng tương đối với neo với giá trị {{cssxref("position-area")}} là `right`.

Phần tử `.positioned2` được định vị theo cách tương tự, ngoại trừ nó được gán tên neo khác làm giá trị `position-anchor` — `--another-anchor` — và nó được định vị ở `bottom` của neo. Chúng ta cũng gán cho nó giá trị {{cssxref("bottom")}} là `5px`, để nếu định vị neo không hoạt động, nó sẽ được định vị ở dưới cùng của `<body>`. Phần tử này không nằm bên trong bất kỳ phần tử có phạm vi nào, do đó nó sẽ chỉ được định vị neo khi các giá trị `anchor-scope` nhất định được đặt trên các phần tử có phạm vi, như được giải thích sau.

```css live-sample___comparing-values
.positioned {
  position: absolute;
  position-anchor: --my-anchor;
  position-area: right;
}

.positioned2 {
  position: absolute;
  bottom: 5px;
  position-anchor: --another-anchor;
  position-area: bottom;
}
```

Chúng ta xử lý việc đặt `anchor-scope` trên các phần tử `<section>` khi các nút radio khác nhau được nhấn bằng JavaScript, đã được ẩn để ngắn gọn.

```js hidden live-sample___comparing-values
const sections = document.querySelectorAll("section");
const form = document.querySelector("form");

function updateScope(val) {
  sections.forEach((section) => (section.style.anchorScope = val));
}

form.addEventListener("input", (e) => {
  updateScope(e.target.value);
});

updateScope("all");
```

#### Kết quả

Ví dụ hiển thị như sau:

{{ EmbedLiveSample("comparing-values", "100%", "225") }}

Hãy kiểm tra hiệu ứng định vị ban đầu được áp dụng cho các phần tử được định vị với `anchor-scope: all` được đặt trên các phần tử `<section>`, sau đó thử chọn các giá trị `anchor-scope` khác để xem tác động của chúng. Bạn sẽ quan sát được điều sau:

- `all`: Phạm vi để định vị các phần tử tương đối với các phần tử neo là con của các phần tử `<section>` bị giới hạn đối với các phần tử được định vị cũng là con của các phần tử `<section>`, bất kể giá trị `anchor-name` nào được sử dụng để liên kết chúng. Kết quả là, các phần tử được định vị bên trong các phần tử `<section>` ("Positioned 1–3") được định vị bằng neo như mong đợi, nhưng phần tử được định vị bên ngoài các phần tử `<section>` ("Positioned 4") không được định vị bằng neo. Nó nằm ngoài phạm vi.
- `--my-anchor`: Phạm vi để định vị các phần tử tương đối với các phần tử neo là con của các phần tử `<section>` bị giới hạn đối với các phần tử được định vị cũng là con của các phần tử `<section>`, chỉ khi tên neo `--my-anchor` được sử dụng để liên kết chúng. Kết quả là, các phần tử được định vị bên trong các phần tử `<section>` ("Positioned 1–3") được định vị bằng neo như mong đợi, và phần tử được định vị bên ngoài các phần tử `<section>` ("Positioned 4") cũng được định vị bằng neo như mong đợi. Trong trường hợp trước, các phần tử được định vị nằm trong phạm vi được đặt, và trong trường hợp sau, phần tử được định vị không bị ảnh hưởng bởi phạm vi được đặt, vì nó sử dụng tên neo bên ngoài phạm vi (`--another-anchor`). Phần tử "Positioned 4" được định vị tương đối với phần tử neo cuối cùng theo thứ tự nguồn có tên neo khớp.
- `none`: Vì không có phạm vi neo nào được đặt trên các phần tử `<section>`, tất cả các phần tử được định vị đều được định vị tương đối với phần tử neo cuối cùng theo thứ tự nguồn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("anchor-name")}}
- {{cssxref("position-anchor")}}
- Mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
