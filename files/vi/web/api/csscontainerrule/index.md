---
title: CSSContainerRule
slug: Web/API/CSSContainerRule
page-type: web-api-interface
browser-compat: api.CSSContainerRule
---

{{ APIRef("CSSOM") }}

Giao diện **`CSSContainerRule`** đại diện cho một quy tắc CSS {{cssxref("@container")}} đơn lẻ.

Đối tượng thuộc loại này có thể được sử dụng để lấy các điều kiện truy vấn của {{cssxref("@container")}}, cùng với tên container nếu có. Lưu ý rằng tên container và truy vấn kết hợp với nhau định nghĩa "văn bản điều kiện", có thể lấy được thông qua {{domxref("CSSConditionRule.conditionText")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ các lớp tổ tiên {{domxref("CSSConditionRule")}}, {{domxref("CSSGroupingRule")}}, và {{domxref("CSSRule")}}._

- {{domxref("CSSContainerRule.containerName")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi biểu thị tên của {{cssxref("@container")}}, hoặc chuỗi rỗng.
- {{domxref("CSSContainerRule.containerQuery")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi biểu thị tập hợp các tính năng hoặc "điều kiện container" được đánh giá để xác định xem các kiểu trong {{cssxref("@container")}} liên kết có được áp dụng hay không.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa phương thức từ các lớp tổ tiên {{domxref("CSSConditionRule")}}, {{domxref("CSSGroupingRule")}}, và {{domxref("CSSRule")}}._

## Ví dụ

### Quy tắc container không tên

Ví dụ dưới đây định nghĩa một quy tắc {{cssxref("@container")}} không tên, và hiển thị các thuộc tính của `CSSContainerRule` liên kết. CSS tương tự như trong ví dụ `@container` [Thiết lập kiểu dựa trên kích thước container](/en-US/docs/Web/CSS/Reference/At-rules/@container#setting_styles_based_on_a_containers_size).

Phần đầu tiên của code tạo một danh sách để ghi lại các thuộc tính quy tắc container, cùng với phương thức JavaScript `log()` để đơn giản hóa việc thêm thuộc tính.

```html
<div id="log">
  <h2>Log</h2>
  <ul></ul>
  <hr />
</div>
```

```js
// Store reference to log list
const logList = document.querySelector("#log ul");
// Function to log data from underlying source
function log(result) {
  const listItem = document.createElement("li");
  listItem.textContent = result;
  logList.appendChild(listItem);
}
```

Sau đó chúng ta định nghĩa HTML cho một `card` (`<div>`) được chứa trong một `post`.

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

CSS cho ví dụ được hiển thị bên dưới. Như được mô tả trong ví dụ {{cssxref("@container")}} tương ứng, CSS cho phần tử container chỉ định loại container. {{cssxref("@container")}} sau đó áp dụng chiều rộng, cỡ chữ và màu nền mới cho card nếu chiều rộng nhỏ hơn 650px.

```html
<style id="example-styles">
  /* A container context based on inline size */
  .post {
    container-type: inline-size;
  }

  /* Apply styles if the container is narrower than 650px */
  @container (width < 650px) {
    .card {
      width: 50%;
      background-color: gray;
      font-size: 1em;
    }
  }
</style>
```

Code dưới đây lấy {{domxref("HTMLStyleElement")}} liên kết với ví dụ bằng id của nó, sau đó sử dụng thuộc tính `sheet` để lấy {{domxref("StyleSheet")}}. Từ `StyleSheet`, chúng ta lấy tập hợp `cssRules` được thêm vào sheet. Vì chúng ta đã thêm `@container` làm quy tắc thứ hai ở trên, chúng ta có thể truy cập `CSSContainerRule` liên kết bằng mục nhập thứ hai, với chỉ số "1", trong `cssRules`. Cuối cùng, chúng ta ghi lại các thuộc tính `containerName`, `containerQuery` và `conditionText` (được kế thừa).

```js
const exampleStylesheet = document.getElementById("example-styles").sheet;
const exampleRules = exampleStylesheet.cssRules;
const containerRule = exampleRules[1]; // a CSSContainerRule representing the container rule.
log(`CSSContainerRule.containerName: "${containerRule.containerName}"`);
log(`CSSContainerRule.containerQuery: "${containerRule.containerQuery}"`);
log(`CSSContainerRule.conditionText: "${containerRule.conditionText}"`);
```

> [!NOTE]
> Các kiểu cho ví dụ này được định nghĩa trong một phần tử HTML `style` nội tuyến với id để giúp code dễ dàng tìm thấy sheet chính xác. Bạn cũng có thể xác định các sheet chính xác cho mỗi ví dụ từ tài liệu bằng cách đánh chỉ số theo độ dài (ví dụ: `document.styleSheets[document.styleSheets.length-1]`) nhưng điều đó làm cho việc xác định sheet chính xác cho mỗi ví dụ phức tạp hơn.

Kết quả ví dụ được hiển thị bên dưới. Phần log liệt kê `containerName`, là chuỗi rỗng vì không có tên nào được định nghĩa. Các chuỗi `containerQuery` và `conditionText` cũng được ghi lại, và có cùng giá trị vì không có tên nào được định nghĩa. Card sẽ thay đổi nền khi chiều rộng của trang chuyển qua 650px.

{{EmbedLiveSample("Unnamed container rule","100%","300px")}}

### Quy tắc container có tên

Ví dụ dưới đây định nghĩa một quy tắc {{cssxref("@container")}} có tên, và hiển thị các thuộc tính của `CSSContainerRule` liên kết. CSS rất giống với ví dụ `@container` [Tạo ngữ cảnh container được đặt tên](/en-US/docs/Web/CSS/Reference/At-rules/@container#creating_named_container_contexts).

```html hidden
<div id="log">
  <h2>Log</h2>
  <ul></ul>
  <hr />
</div>
```

```js hidden
// Store reference to log list
const logList = document.querySelector("#log ul");
// Function to log data from underlying source
function log(result) {
  const listItem = document.createElement("li");
  listItem.textContent = result;
  logList.appendChild(listItem);
}
```

Đầu tiên chúng ta định nghĩa HTML cho một `card` (`<div>`) được chứa trong một `post` (ví dụ không hiển thị code ghi log, vì nó giống như ví dụ trước).

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

Như được mô tả trong {{cssxref("@container")}}, CSS cho phần tử container chỉ định loại container, và cũng có thể chỉ định tên cho container. Card có cỡ chữ mặc định, được ghi đè cho `@container` tên `sidebar` nếu chiều rộng tối thiểu lớn hơn 700px.

```html
<style id="example-styles">
  .post {
    container-type: inline-size;
    container-name: sidebar;
  }

  /* Default heading styles for the card title */
  .card h2 {
    font-size: 1em;
  }

  @container sidebar (width >= 700px) {
    .card {
      font-size: 2em;
    }
  }
</style>
```

Code để lấy sheet và quy tắc gần như giống với ví dụ trước. Điểm khác biệt duy nhất là trong ví dụ này chúng ta có ba quy tắc CSS, vì vậy để lấy `CSSContainerRule` liên kết, chúng ta lấy mục nhập thứ ba trong `cssRules`.

```js
const exampleStylesheet = document.getElementById("example-styles").sheet;
const exampleRules = exampleStylesheet.cssRules;
const containerRule = exampleRules[2]; // a CSSContainerRule representing the container rule.
log(`CSSContainerRule.containerName: "${containerRule.containerName}"`);
log(`CSSContainerRule.containerQuery: "${containerRule.containerQuery}"`);
log(`CSSContainerRule.conditionText: "${containerRule.conditionText}"`);
```

Kết quả ví dụ được hiển thị bên dưới. Phần log liệt kê các chuỗi `containerName` và `containerQuery`. `conditionText` cũng được ghi lại, và hiển thị sự kết hợp của hai chuỗi này. Tiêu đề trong phần card sẽ tăng gấp đôi kích thước khi chiều rộng của trang vượt qua 700px.

{{EmbedLiveSample("Named container rule","100%","300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- CSS {{cssxref("container-name")}}, {{cssxref("container-type")}}, và thuộc tính viết tắt {{cssxref("container")}}
- [Mô-đun CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
- [Truy vấn container](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Sử dụng truy vấn kích thước và kiểu container](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
