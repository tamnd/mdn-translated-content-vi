---
title: Khả năng tiếp cận bảng HTML
short-title: Khả năng tiếp cận bảng
slug: Learn_web_development/Core/Structuring_content/Table_accessibility
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_table_basics", "Learn_web_development/Core/Structuring_content/Planet_data_table", "Learn_web_development/Core/Structuring_content")}}

Trong bài viết trước, chúng ta đã xem xét một trong những tính năng quan trọng nhất để làm cho bảng HTML có thể tiếp cận với người dùng khiếm thị — phần tử {{htmlelement("th")}}. Trong bài viết này, chúng ta tiếp tục theo hướng này, xem xét thêm các tính năng khả năng tiếp cận bảng HTML như phụ đề/tóm tắt, nhóm hàng vào các phần đầu, thân và chân bảng, và phân phạm vi cột và hàng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (xem
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >).
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu biết về các vấn đề khả năng tiếp cận liên quan đến bảng.</li>
          <li>Thêm phụ đề vào bảng.</li>
          <li>Cấu trúc bảng tốt hơn với phần đầu, thân và chân.</li>
          <li>Tạo thêm liên kết giữa tiêu đề và ô với các thuộc tính <code>scope</code>, <code>id</code>, và <code>headers</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt: Bảng cho người dùng khiếm thị

Hãy tóm tắt ngắn gọn về cách chúng ta sử dụng bảng dữ liệu. Bảng có thể là công cụ tiện lợi, cung cấp cho chúng ta quyền truy cập nhanh vào dữ liệu và cho phép chúng ta tra cứu các giá trị khác nhau. Ví dụ, chỉ cần nhìn nhanh vào bảng dưới đây để biết có bao nhiêu chiếc nhẫn đã được bán ở Ghent trong tháng 8 năm 2016. Để hiểu thông tin của nó, chúng ta tạo ra các liên kết hình ảnh giữa dữ liệu trong bảng này và tiêu đề cột và/hoặc hàng của nó.

<table>
  <caption>Items Sold August 2016</caption>
  <thead>
    <tr>
      <td colspan="2" rowspan="2"></td>
      <th colspan="3" scope="colgroup">Clothes</th>
      <th colspan="2" scope="colgroup">Accessories</th>
    </tr>
    <tr>
      <th scope="col">Trousers</th>
      <th scope="col">Skirts</th>
      <th scope="col">Dresses</th>
      <th scope="col">Bracelets</th>
      <th scope="col">Rings</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" scope="rowgroup">Belgium</th>
      <th scope="row">Antwerp</th>
      <td>56</td>
      <td>22</td>
      <td>43</td>
      <td>72</td>
      <td>23</td>
    </tr>
    <tr>
      <th scope="row">Ghent</th>
      <td>46</td>
      <td>18</td>
      <td>50</td>
      <td>61</td>
      <td>15</td>
    </tr>
    <tr>
      <th scope="row">Brussels</th>
      <td>51</td>
      <td>27</td>
      <td>38</td>
      <td>69</td>
      <td>28</td>
    </tr>
    <tr>
      <th rowspan="2" scope="rowgroup">The Netherlands</th>
      <th scope="row">Amsterdam</th>
      <td>89</td>
      <td>34</td>
      <td>69</td>
      <td>85</td>
      <td>38</td>
    </tr>
    <tr>
      <th scope="row">Utrecht</th>
      <td>80</td>
      <td>12</td>
      <td>43</td>
      <td>36</td>
      <td>19</td>
    </tr>
  </tbody>
</table>

Nhưng nếu bạn không thể tạo ra những liên kết hình ảnh đó thì sao? Làm thế nào bạn có thể đọc một bảng như trên? Người khiếm thị thường sử dụng [trình đọc màn hình](/en-US/docs/Glossary/Screen_reader) đọc to thông tin trên các trang web cho họ. Điều này không có vấn đề khi bạn đọc văn bản thuần, nhưng diễn giải một bảng có thể là thách thức khá lớn đối với người mù. Tuy nhiên, với đánh dấu phù hợp, chúng ta có thể thay thế các liên kết hình ảnh bằng các liên kết theo chương trình.

> [!NOTE]
> Có khoảng 253 triệu người sống với Khiếm thị Thị giác theo [dữ liệu WHO năm 2017](https://www.who.int/en/news-room/fact-sheets/detail/blindness-and-visual-impairment).

### Sử dụng tiêu đề cột và hàng

Các trình đọc màn hình sẽ xác định tất cả tiêu đề và sử dụng chúng để tạo ra các liên kết theo chương trình giữa những tiêu đề đó và các ô mà chúng liên quan đến. Sự kết hợp của tiêu đề cột và hàng sẽ xác định và diễn giải dữ liệu trong mỗi ô để người dùng trình đọc màn hình có thể diễn giải bảng tương tự như cách người dùng có thị lực làm.

Chúng ta đã đề cập đến tiêu đề trong bài viết trước — xem [Thêm tiêu đề với phần tử \<th>](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics#adding_headers_with_th_elements).

## Thêm phụ đề vào bảng với \<caption>

Bạn có thể đặt tiêu đề cho bảng bằng cách đặt nó trong phần tử {{htmlelement("caption")}} và lồng phần tử đó vào trong phần tử {{htmlelement("table")}}. Bạn nên đặt nó ngay dưới thẻ `<table>` mở.

```html
<table>
  <caption>
    Dinosaurs in the Jurassic period
  </caption>
  <!-- … -->
</table>
```

Như bạn có thể suy ra từ ví dụ ngắn gọn ở trên, phụ đề có nghĩa là chứa mô tả về nội dung bảng. Điều này hữu ích cho tất cả độc giả muốn biết nhanh liệu bảng có hữu ích cho họ không khi họ quét trang, nhưng đặc biệt cho người dùng mù. Thay vì để trình đọc màn hình đọc nội dung nhiều ô chỉ để tìm hiểu bảng nói về cái gì, người dùng có thể dựa vào phụ đề và sau đó quyết định có đọc bảng chi tiết hơn không.

Phụ đề được đặt ngay bên dưới thẻ `<table>`.

> [!NOTE]
> Thuộc tính [`summary`](/en-US/docs/Web/HTML/Reference/Elements/table#summary) cũng có thể được sử dụng trên phần tử `<table>` để cung cấp mô tả — điều này cũng được các trình đọc màn hình đọc to. Tuy nhiên, chúng tôi khuyến nghị sử dụng phần tử `<caption>` thay vào đó, vì `summary` đã bị xóa bỏ và không thể được đọc bởi người dùng có thị lực (nó không xuất hiện trên trang).

### Thực hành phụ đề bảng

Tại đây chúng tôi sẽ yêu cầu bạn thử thêm phụ đề vào bảng HTML, sử dụng thời gian biểu của trường mà bạn đã gặp trong bài viết trước.

1. Sao chép khối HTML đầu tiên trong [Nhóm cột với `<colgroup>` và `<col>`](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics#grouping_columns_with_colgroup_and_col) vào tệp HTML trên máy tính của bạn, hoặc trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSBin](https://jsbin.com/).
2. Thêm phụ đề phù hợp vào bảng.
3. Lưu mã của bạn và xem nó trông như thế nào.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<table>
  <caption>
    St. Winnifred's weekly language lesson timetable
  </caption>
  <colgroup>
    <col span="2" />
    <col class="column-background" />
    <col class="column-fixed-width" />
    <col class="column-background" />
    <col class="column-background-border" />
    <col span="2" class="column-fixed-width" />
  </colgroup>

  <!-- Rest of code omitted for brevity -->
</table>
```

</details>

## Thêm cấu trúc với \<thead>, \<tbody>, và \<tfoot>

Khi bảng của bạn trở nên phức tạp hơn trong cấu trúc, sẽ hữu ích khi cung cấp cho chúng định nghĩa cấu trúc hơn. Một cách rõ ràng để thực hiện điều này là bằng cách sử dụng {{htmlelement("thead")}}, {{htmlelement("tbody")}}, và {{htmlelement("tfoot")}}, cho phép bạn đánh dấu phần đầu, thân và chân của bảng.

Các phần tử này không nhất thiết làm cho bảng dễ tiếp cận hơn đối với người dùng trình đọc màn hình. Chúng không tạo ra bất kỳ cải tiến hình ảnh nào tự nó, tuy nhiên chúng rất hữu ích để áp dụng các cải tiến tạo kiểu và bố cục thông qua CSS, có thể cải thiện khả năng tiếp cận. Để cho bạn một số ví dụ thú vị, trong trường hợp bảng dài, bạn có thể làm cho tiêu đề và chân bảng lặp lại trên mỗi trang in, và bạn có thể làm cho thân bảng hiển thị trên một trang và nội dung có thể cuộn lên xuống.

Để sử dụng chúng, chúng nên được bao gồm theo thứ tự sau:

- Phần tử `<thead>` phải bao bọc phần của bảng là tiêu đề — đây thường là hàng đầu tiên chứa tiêu đề cột, nhưng không nhất thiết luôn như vậy. Nếu bạn đang sử dụng các phần tử {{htmlelement("col")}}/{{htmlelement("colgroup")}}, tiêu đề bảng nên đến ngay sau những phần tử đó.
- Phần tử `<tbody>` cần bao bọc phần chính của nội dung bảng không phải là tiêu đề hoặc chân bảng, và nên đến sau `<thead>`.
- Phần tử `<tfoot>` cần bao bọc phần của bảng là chân — đây có thể là hàng cuối cùng với các mục trong các hàng trước được tổng hợp, ví dụ. `<tfoot>` nên đến sau `<tbody>`.

> [!NOTE]
> `<tbody>` luôn được ngụ ý bao gồm trong mỗi bảng nếu bạn không chỉ định nó trong mã của mình. Để kiểm tra điều này, hãy mở một trong các ví dụ trước của bạn không bao gồm `<tbody>` và xem mã HTML trong [công cụ dành cho nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) — bạn sẽ thấy rằng trình duyệt đã thêm thẻ này cho bạn. Bạn có thể tự hỏi tại sao bạn phải bao gồm nó — bạn nên làm vậy, vì nó cung cấp cho bạn nhiều quyền kiểm soát hơn đối với cấu trúc và tạo kiểu bảng.

### Thêm cấu trúc vào bảng ghi chi tiêu

Hãy để bạn áp dụng những phần tử mới này vào thực tế.

1. Trước hết, hãy tạo tệp HTML mới có tên `spending-record.html` và đặt HTML sau vào trong `<body>`:

   ```html
   <h1>My spending record</h1>

   <table>
     <caption>
       How I chose to spend my money
     </caption>
     <tr>
       <th>Purchase</th>
       <th>Location</th>
       <th>Date</th>
       <th>Evaluation</th>
       <th>Cost (€)</th>
     </tr>
     <tr>
       <td>Haircut</td>
       <td>Hairdresser</td>
       <td>12/09</td>
       <td>Great idea</td>
       <td>30</td>
     </tr>
     <tr>
       <td>Lasagna</td>
       <td>Restaurant</td>
       <td>12/09</td>
       <td>Regrets</td>
       <td>18</td>
     </tr>
     <tr>
       <td>Shoes</td>
       <td>Shoe shop</td>
       <td>13/09</td>
       <td>Big regrets</td>
       <td>65</td>
     </tr>
     <tr>
       <td>Toothpaste</td>
       <td>Supermarket</td>
       <td>13/09</td>
       <td>Good</td>
       <td>5</td>
     </tr>
     <tr>
       <td>SUM</td>
       <td>118</td>
     </tr>
   </table>
   ```

2. Tiếp theo, hãy tạo tệp CSS có tên `minimal-table.css` trong cùng thư mục với tệp HTML của bạn và điền vào với nội dung sau:

   ```css live-sample___finished-table-structure
   html {
     font-family: sans-serif;
   }

   table {
     border-collapse: collapse;
     border: 2px solid rgb(200 200 200);
     letter-spacing: 1px;
     font-size: 0.8rem;
   }

   td,
   th {
     border: 1px solid rgb(190 190 190);
     padding: 10px 20px;
   }

   th {
     background-color: rgb(235 235 235);
   }

   td {
     text-align: center;
   }

   tr:nth-child(even) td {
     background-color: rgb(250 250 250);
   }

   tr:nth-child(odd) td {
     background-color: rgb(245 245 245);
   }

   caption {
     padding: 10px;
   }
   ```

3. Thêm phần tử `<link>` vào `<head>` HTML của bạn để áp dụng CSS vào HTML (xem [Áp dụng CSS và JavaScript vào HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#applying_css_and_javascript_to_html) để được trợ giúp với điều này).

4. Hãy thử đặt hàng tiêu đề rõ ràng vào bên trong phần tử `<thead>`, hàng "SUM" vào trong phần tử `<tfoot>`, và phần còn lại của nội dung vào trong phần tử `<tbody>`.
5. Tiếp theo, thêm thuộc tính [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) để làm cho ô "SUM" kéo dài qua bốn cột đầu tiên, sao cho số thực tế xuất hiện ở cuối cột "Cost".
6. Hãy thêm một số tạo kiểu đơn giản vào bảng, để cho bạn thấy những phần tử này hữu ích như thế nào để áp dụng CSS. Thêm phần sau vào tệp CSS của bạn:

   ```css live-sample___finished-table-structure
   tbody {
     font-size: 95%;
     font-style: italic;
   }

   tfoot {
     font-weight: bold;
   }
   ```

   > [!NOTE]
   > Chúng tôi không mong bạn hiểu hoàn toàn CSS ngay bây giờ. Bạn sẽ tìm hiểu thêm về điều này khi bạn xem qua các mô-đun CSS (bắt đầu với [Kiến thức cơ bản về tạo kiểu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), bao gồm bài viết cụ thể về [tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)).

7. Lưu và làm mới, và xem kết quả. Nếu các phần tử `<tbody>` và `<tfoot>` không có ở đó, bạn sẽ phải viết các bộ chọn/quy tắc phức tạp hơn nhiều để áp dụng cùng tạo kiểu.

Ví dụ hoàn chỉnh sẽ trông như thế này:

{{embedlivesample("finished-table-structure", "100%", "300")}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html live-sample___finished-table-structure
<table>
  <caption>
    How I chose to spend my money
  </caption>
  <thead>
    <tr>
      <th>Purchase</th>
      <th>Location</th>
      <th>Date</th>
      <th>Evaluation</th>
      <th>Cost (€)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Haircut</td>
      <td>Hairdresser</td>
      <td>12/09</td>
      <td>Great idea</td>
      <td>30</td>
    </tr>
    <tr>
      <td>Lasagna</td>
      <td>Restaurant</td>
      <td>12/09</td>
      <td>Regrets</td>
      <td>18</td>
    </tr>
    <tr>
      <td>Shoes</td>
      <td>Shoe shop</td>
      <td>13/09</td>
      <td>Big regrets</td>
      <td>65</td>
    </tr>
    <tr>
      <td>Toothpaste</td>
      <td>Supermarket</td>
      <td>13/09</td>
      <td>Good</td>
      <td>5</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="4">SUM</td>
      <td>118</td>
    </tr>
  </tfoot>
</table>
```

</details>

## Thuộc tính `scope`

Thuộc tính [`scope`](/en-US/docs/Web/HTML/Reference/Elements/th#scope) có thể được thêm vào phần tử `<th>` để cho trình đọc màn hình biết chính xác những ô nào mà tiêu đề là tiêu đề của — là tiêu đề cho hàng mà nó ở trong, hoặc cột, ví dụ? Nhìn lại ví dụ ghi chi tiêu của chúng ta từ trước, bạn có thể định nghĩa một cách rõ ràng các tiêu đề cột là tiêu đề cột như thế này:

```html
<thead>
  <tr>
    <th scope="col">Purchase</th>
    <th scope="col">Location</th>
    <th scope="col">Date</th>
    <th scope="col">Evaluation</th>
    <th scope="col">Cost (€)</th>
  </tr>
</thead>
```

Và mỗi hàng có thể có tiêu đề được định nghĩa như thế này (nếu chúng ta thêm tiêu đề hàng cũng như tiêu đề cột):

```html
<tr>
  <th scope="row">Haircut</th>
  <td>Hairdresser</td>
  <td>12/09</td>
  <td>Great idea</td>
  <td>30</td>
</tr>
```

Các trình đọc màn hình sẽ nhận ra đánh dấu được cấu trúc như thế này, và cho phép người dùng của chúng đọc to toàn bộ cột hoặc hàng cùng một lúc, ví dụ.

`scope` có thêm hai giá trị có thể — `colgroup` và `rowgroup`. Chúng được sử dụng cho các tiêu đề nằm trên đỉnh của nhiều cột hoặc hàng. Nếu bạn nhìn lại bảng "Items Sold August 2016" ở đầu phần này của bài viết, bạn sẽ thấy rằng ô "Clothes" nằm phía trên các ô "Trousers", "Skirts", và "Dresses". Tất cả các ô này nên được đánh dấu là tiêu đề (`<th>`), nhưng "Clothes" là tiêu đề nằm ở trên và xác định ba tiêu đề con kia. "Clothes" do đó nên nhận thuộc tính `scope="colgroup"`, trong khi các ô kia sẽ nhận thuộc tính `scope="col"`:

```html
<thead>
  <tr>
    <th colspan="3" scope="colgroup">Clothes</th>
  </tr>
  <tr>
    <th scope="col">Trousers</th>
    <th scope="col">Skirts</th>
    <th scope="col">Dresses</th>
  </tr>
</thead>
```

Điều tương tự áp dụng cho tiêu đề của nhiều hàng được nhóm lại. Hãy nhìn lại bảng "Items Sold August 2016" một lần nữa, lần này tập trung vào các hàng với tiêu đề "Amsterdam" và "Utrecht" (`<th>`). Bạn sẽ nhận thấy rằng tiêu đề "The Netherlands", cũng được đánh dấu là phần tử `<th>`, kéo dài cả hai hàng, là tiêu đề cho hai tiêu đề con kia. Do đó, `scope="rowgroup"` nên được chỉ định trên ô tiêu đề này để giúp trình đọc màn hình tạo ra các liên kết chính xác:

```html
<tr>
  <th rowspan="2" scope="rowgroup">The Netherlands</th>
  <th scope="row">Amsterdam</th>
  <td>89</td>
  <td>34</td>
  <td>69</td>
</tr>
<tr>
  <th scope="row">Utrecht</th>
  <td>80</td>
  <td>12</td>
  <td>43</td>
</tr>
```

## Thuộc tính `id` và `headers`

Một cách thay thế sử dụng thuộc tính `scope` là sử dụng các thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) và [`headers`](/en-US/docs/Web/HTML/Reference/Elements/td#headers) để tạo liên kết giữa các ô dữ liệu và các ô tiêu đề.

Phần tử `<th>` có thể cung cấp tiêu đề cho ô dữ liệu (`<td>`) hoặc, trong các bảng phức tạp hơn, cho một ô tiêu đề khác (`<th>`). Điều này cho phép bạn tạo các tiêu đề phân lớp hoặc nhóm, nơi một tiêu đề mô tả một số tiêu đề khác.

Thuộc tính `headers` được sử dụng để liên kết một ô, `<td>` hoặc `<th>`, với một hoặc nhiều ô tiêu đề. Nó nhận một danh sách {{Glossary("string", "chuỗi")}} được phân tách bằng dấu cách; thứ tự của chuỗi không quan trọng. Mỗi chuỗi phải khớp với `id` duy nhất của phần tử `<th>` mà ô được liên kết với.

Phương pháp này cung cấp cho bảng HTML của bạn định nghĩa rõ ràng hơn về vị trí của mỗi ô, dựa trên tiêu đề của cột và hàng mà nó thuộc về, giống như bảng tính. Để điều này hoạt động tốt, bảng của bạn nên bao gồm cả tiêu đề cột và tiêu đề hàng.

Hãy xem một phần của ví dụ "Items Sold August 2016" để thấy cách sử dụng các thuộc tính `id` và `headers`:

1. Thêm `id` duy nhất vào mỗi phần tử `<th>` trong bảng.
2. Đối với các ô tiêu đề: Thêm thuộc tính `headers` vào mỗi phần tử `<th>` hoạt động như tiêu đề con, nghĩa là ô tiêu đề có tiêu đề khác ở trên nó. Giá trị là `id` của tiêu đề cấp cao. Trong ví dụ của chúng ta, đó là `"clothes"` cho tiêu đề cột và `"belgium"` cho tiêu đề hàng.
3. Đối với các ô dữ liệu: Thêm thuộc tính `headers` vào mỗi phần tử `<td>`, và thêm `id` của (các) phần tử `<th>` liên quan dưới dạng danh sách được phân tách bằng dấu cách. Bạn có thể tiến hành như bạn làm trong bảng tính: Tìm ô dữ liệu, sau đó xác định vị trí tiêu đề hàng và cột mô tả nó. Thứ tự của `id` được chỉ định không quan trọng, nhưng giữ nhất quán giúp giữ cho nó có tổ chức và cải thiện khả năng đọc của mã.

```html
<thead>
  <tr>
    <th></th>
    <th></th>
    <th id="clothes" colspan="3">Clothes</th>
  </tr>
  <tr>
    <th></th>
    <th></th>
    <th id="trousers" headers="clothes">Trousers</th>
    <th id="skirts" headers="clothes">Skirts</th>
    <th id="dresses" headers="clothes">Dresses</th>
  </tr>
</thead>
<tbody>
  <tr>
    <th id="belgium" rowspan="2">Belgium</th>
    <th id="antwerp" headers="belgium">Antwerp</th>
    <td headers="belgium antwerp clothes trousers">56</td>
    <td headers="belgium antwerp clothes skirts">22</td>
    <td headers="belgium antwerp clothes dresses">43</td>
  </tr>
  <tr>
    <th id="ghent" headers="belgium">Ghent</th>
    <td headers="belgium ghent clothes trousers">41</td>
    <td headers="belgium ghent clothes skirts">17</td>
    <td headers="belgium ghent clothes dresses">35</td>
  </tr>
</tbody>
```

Trong ví dụ này:

- `<th>` cho `"Belgium"` sử dụng `rowspan="2"` để kéo dài cả `"Antwerp"` và `"Ghent"`.
- Các ô tiêu đề thành phố (`"Antwerp"` và `"Ghent"`) sử dụng thuộc tính `headers` để tham chiếu `"belgium"` để cho thấy chúng thuộc nhóm Belgium.
- Mỗi `<td>` bao gồm thuộc tính `headers` cho quốc gia (`belgium`), thành phố (`antwerp` hoặc `ghent`), nhóm (`clothes`), và mặt hàng quần áo cụ thể (`trousers`, `skirts`, hoặc `dresses`).

> [!NOTE]
> Phương pháp này tạo ra các liên kết rất chính xác giữa tiêu đề và các ô dữ liệu nhưng nó sử dụng **rất nhiều** đánh dấu hơn và không để lại bất kỳ chỗ nào cho lỗi. Cách tiếp cận `scope` thường đủ cho hầu hết các bảng.

## Thực hành scope và headers

Trong bài tập cuối cùng này, chúng tôi sẽ yêu cầu bạn thử sử dụng scope và headers trên bảng mẫu mà chúng ta đã giới thiệu ở trên.

1. Trước tiên, hãy tạo bản sao cục bộ của [items-sold.html](https://github.com/mdn/learning-area/blob/main/html/tables/advanced/items-sold.html) và [minimal-table.css](https://github.com/mdn/learning-area/blob/main/html/tables/advanced/minimal-table.css), trong một thư mục mới.
2. Hãy thử thêm các thuộc tính `scope` phù hợp để làm cho bảng này có thể tiếp cận hơn.
3. Tạo bản sao khác của các tệp bắt đầu trong một thư mục cục bộ khác
4. Lần này hãy làm cho bảng có thể tiếp cận hơn bằng cách tạo các liên kết chính xác và rõ ràng sử dụng các thuộc tính `id` và `headers`.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Ví dụ HTML hoàn chỉnh đầu tiên sẽ trông giống như thế này:

```html
<table>
  <caption>
    Items Sold August 2016
  </caption>
  <thead>
    <tr>
      <td colspan="2" rowspan="2"></td>
      <th colspan="3" scope="colgroup">Clothes</th>
      <th colspan="2" scope="colgroup">Accessories</th>
    </tr>
    <tr>
      <th scope="col">Trousers</th>
      <th scope="col">Skirts</th>
      <th scope="col">Dresses</th>
      <th scope="col">Bracelets</th>
      <th scope="col">Rings</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" scope="rowgroup">Belgium</th>
      <th scope="row">Antwerp</th>
      <td>56</td>
      <td>22</td>
      <td>43</td>
      <td>72</td>
      <td>23</td>
    </tr>
    <tr>
      <th scope="row">Ghent</th>
      <td>46</td>
      <td>18</td>
      <td>50</td>
      <td>61</td>
      <td>15</td>
    </tr>
    <tr>
      <th scope="row">Brussels</th>
      <td>51</td>
      <td>27</td>
      <td>38</td>
      <td>69</td>
      <td>28</td>
    </tr>
    <tr>
      <th rowspan="2" scope="rowgroup">The Netherlands</th>
      <th scope="row">Amsterdam</th>
      <td>89</td>
      <td>34</td>
      <td>69</td>
      <td>85</td>
      <td>38</td>
    </tr>
    <tr>
      <th scope="row">Utrecht</th>
      <td>80</td>
      <td>12</td>
      <td>43</td>
      <td>36</td>
      <td>19</td>
    </tr>
  </tbody>
</table>
```

Trong khi ví dụ thứ hai sẽ trông như thế này:

```html
<table>
  <caption>
    Items Sold August 2016
  </caption>
  <thead>
    <tr>
      <td colspan="2" rowspan="2"></td>
      <th colspan="3" id="clothes">Clothes</th>
      <th colspan="2" id="accessories">Accessories</th>
    </tr>
    <tr>
      <th id="trousers" headers="clothes">Trousers</th>
      <th id="skirts" headers="clothes">Skirts</th>
      <th id="dresses" headers="clothes">Dresses</th>
      <th id="bracelets" headers="accessories">Bracelets</th>
      <th id="rings" headers="accessories">Rings</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" id="belgium">Belgium</th>
      <th id="antwerp" headers="belgium">Antwerp</th>
      <td headers="antwerp belgium clothes trousers">56</td>
      <td headers="antwerp belgium clothes skirts">22</td>
      <td headers="antwerp belgium clothes dresses">43</td>
      <td headers="antwerp belgium accessories bracelets">72</td>
      <td headers="antwerp belgium accessories rings">23</td>
    </tr>
    <tr>
      <th id="ghent" headers="belgium">Ghent</th>
      <td headers="ghent belgium clothes trousers">46</td>
      <td headers="ghent belgium clothes skirts">18</td>
      <td headers="ghent belgium clothes dresses">50</td>
      <td headers="ghent belgium accessories bracelets">61</td>
      <td headers="ghent belgium accessories rings">15</td>
    </tr>
    <tr>
      <th id="brussels" headers="belgium">Brussels</th>
      <td headers="brussels belgium clothes trousers">51</td>
      <td headers="brussels belgium clothes skirts">27</td>
      <td headers="brussels belgium clothes dresses">38</td>
      <td headers="brussels belgium accessories bracelets">69</td>
      <td headers="brussels belgium accessories rings">28</td>
    </tr>
    <tr>
      <th rowspan="2" id="netherlands">The Netherlands</th>
      <th id="amsterdam" headers="netherlands">Amsterdam</th>
      <td headers="amsterdam netherlands clothes trousers">89</td>
      <td headers="amsterdam netherlands clothes skirts">34</td>
      <td headers="amsterdam netherlands clothes dresses">69</td>
      <td headers="amsterdam netherlands accessories bracelets">85</td>
      <td headers="amsterdam netherlands accessories rings">38</td>
    </tr>
    <tr>
      <th id="utrecht" headers="netherlands">Utrecht</th>
      <td headers="utrecht netherlands clothes trousers">80</td>
      <td headers="utrecht netherlands clothes skirts">12</td>
      <td headers="utrecht netherlands clothes dresses">43</td>
      <td headers="utrecht netherlands accessories bracelets">36</td>
      <td headers="utrecht netherlands accessories rings">19</td>
    </tr>
  </tbody>
</table>
```

Bạn cũng có thể tìm thấy các ví dụ hoàn chỉnh trên GitHub:

- Đối với ví dụ đầu tiên, xem [items-sold-scope.html](https://github.com/mdn/learning-area/blob/main/html/tables/advanced/items-sold-scope.html) ([xem nó chạy trực tiếp cũng](https://mdn.github.io/learning-area/html/tables/advanced/items-sold-scope.html)).
- Đối với ví dụ thứ hai, xem [items-sold-headers.html](https://github.com/mdn/learning-area/blob/main/html/tables/advanced/items-sold-headers.html) ([xem nó chạy trực tiếp cũng](https://mdn.github.io/learning-area/html/tables/advanced/items-sold-headers.html)).

</details>

## Tóm tắt

Còn một vài điều khác bạn có thể tìm hiểu về bảng trong HTML, nhưng đây là tất cả những gì bạn cần biết hiện tại. Tiếp theo, bạn có thể tự kiểm tra với thách thức bảng HTML. Chúc vui!

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_table_basics", "Learn_web_development/Core/Structuring_content/Planet_data_table", "Learn_web_development/Core/Structuring_content")}}
