---
title: Kiến thức cơ bản về bảng HTML
short-title: Kiến thức cơ bản về bảng
slug: Learn_web_development/Core/Structuring_content/HTML_table_basics
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Splash_page", "Learn_web_development/Core/Structuring_content/Table_accessibility", "Learn_web_development/Core/Structuring_content")}}

Bài viết này giúp bạn bắt đầu với các bảng HTML, bao gồm những kiến thức cơ bản nhất như hàng, ô, tiêu đề, làm cho các ô kéo dài nhiều cột và hàng, và cách nhóm tất cả các ô trong một cột để phục vụ mục đích tạo kiểu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Bảng dùng để làm gì — cấu trúc dữ liệu dạng bảng.</li>
          <li>Bảng không dùng để làm gì — bố cục, hoặc <em>bất kỳ thứ gì khác</em>.</li>
          <li>Cú pháp bảng cơ bản — <code>&lt;table&gt;</code>, <code>&lt;tr&gt;</code>, và <code>&lt;td&gt;</code>.</li>
          <li>Xác định tiêu đề bảng với <code>&lt;th&gt;</code>.</li>
          <li>Kéo dài nhiều cột và hàng với <code>colspan</code> và <code>rowspan</code>.</li>
          <li>Nhóm cột với <code>&lt;colgroup&gt;</code> và <code>&lt;col&gt;</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Bảng là gì?

Bảng là một tập hợp dữ liệu có cấu trúc được tạo thành từ hàng và cột (**dữ liệu dạng bảng**). Bảng cho phép bạn nhanh chóng và dễ dàng tra cứu các giá trị cho thấy một loại kết nối nào đó giữa các loại dữ liệu khác nhau, ví dụ như một người và tuổi của họ, hoặc ngày trong tuần, hoặc thời gian biểu của một hồ bơi địa phương.

![Bảng mẫu hiển thị tên và tuổi của một số người - Chris 38, Dennis 45, Sarah 29, Karen 47.](numbers-table.png)

![Thời gian biểu bơi hiển thị bảng dữ liệu mẫu](swimming-timetable.png)

Bảng được sử dụng rất phổ biến trong xã hội loài người, và đã như vậy từ lâu, như được chứng minh bởi tài liệu điều tra dân số Hoa Kỳ này từ năm 1800:

![Một tài liệu da cừu rất cũ; dữ liệu không dễ đọc, nhưng rõ ràng cho thấy một bảng dữ liệu đang được sử dụng.](1800-census.jpg)

Do đó, không có gì ngạc nhiên khi những người tạo ra HTML đã cung cấp một phương tiện để cấu trúc và trình bày dữ liệu dạng bảng trên web.

### Bảng hoạt động như thế nào?

Điểm mấu chốt của bảng là nó cứng nhắc. Thông tin được diễn giải dễ dàng bằng cách tạo ra các liên kết hình ảnh giữa tiêu đề hàng và cột. Hãy nhìn vào bảng dưới đây và tìm hành tinh khí khổng lồ Jovian với 62 mặt trăng. Bạn có thể tìm thấy câu trả lời bằng cách liên kết các tiêu đề hàng và cột liên quan.

```html hidden
<table>
  <caption>
    Data about the planets of our solar system (Source:
    <a href="https://nssdc.gsfc.nasa.gov/planetary/factsheet/"
      >Nasa's Planetary Fact Sheet - Metric</a
    >).
  </caption>
  <thead>
    <tr>
      <td colspan="2"></td>
      <th scope="col">Name</th>
      <th scope="col">Mass (10<sup>24</sup>kg)</th>
      <th scope="col">Diameter (km)</th>
      <th scope="col">Density (kg/m<sup>3</sup>)</th>
      <th scope="col">Gravity (m/s<sup>2</sup>)</th>
      <th scope="col">Length of day (hours)</th>
      <th scope="col">Distance from Sun (10<sup>6</sup>km)</th>
      <th scope="col">Mean temperature (°C)</th>
      <th scope="col">Number of moons</th>
      <th scope="col">Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th colspan="2" rowspan="4" scope="rowgroup">Terrestrial planets</th>
      <th scope="row">Mercury</th>
      <td>0.330</td>
      <td>4,879</td>
      <td>5427</td>
      <td>3.7</td>
      <td>4222.6</td>
      <td>57.9</td>
      <td>167</td>
      <td>0</td>
      <td>Closest to the Sun</td>
    </tr>
    <tr>
      <th scope="row">Venus</th>
      <td>4.87</td>
      <td>12,104</td>
      <td>5243</td>
      <td>8.9</td>
      <td>2802.0</td>
      <td>108.2</td>
      <td>464</td>
      <td>0</td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Earth</th>
      <td>5.97</td>
      <td>12,756</td>
      <td>5514</td>
      <td>9.8</td>
      <td>24.0</td>
      <td>149.6</td>
      <td>15</td>
      <td>1</td>
      <td>Our world</td>
    </tr>
    <tr>
      <th scope="row">Mars</th>
      <td>0.642</td>
      <td>6,792</td>
      <td>3933</td>
      <td>3.7</td>
      <td>24.7</td>
      <td>227.9</td>
      <td>-65</td>
      <td>2</td>
      <td>The red planet</td>
    </tr>
    <tr>
      <th rowspan="4" scope="rowgroup">Jovian planets</th>
      <th rowspan="2" scope="rowgroup">Gas giants</th>
      <th scope="row">Jupiter</th>
      <td>1898</td>
      <td>142,984</td>
      <td>1326</td>
      <td>23.1</td>
      <td>9.9</td>
      <td>778.6</td>
      <td>-110</td>
      <td>67</td>
      <td>The largest planet</td>
    </tr>
    <tr>
      <th scope="row">Saturn</th>
      <td>568</td>
      <td>120,536</td>
      <td>687</td>
      <td>9.0</td>
      <td>10.7</td>
      <td>1433.5</td>
      <td>-140</td>
      <td>62</td>
      <td></td>
    </tr>
    <tr>
      <th rowspan="2" scope="rowgroup">Ice giants</th>
      <th scope="row">Uranus</th>
      <td>86.8</td>
      <td>51,118</td>
      <td>1271</td>
      <td>8.7</td>
      <td>17.2</td>
      <td>2872.5</td>
      <td>-195</td>
      <td>27</td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Neptune</th>
      <td>102</td>
      <td>49,528</td>
      <td>1638</td>
      <td>11.0</td>
      <td>16.1</td>
      <td>4495.1</td>
      <td>-200</td>
      <td>14</td>
      <td></td>
    </tr>
    <tr>
      <th colspan="2" scope="rowgroup">Dwarf planets</th>
      <th scope="row">Pluto</th>
      <td>0.0146</td>
      <td>2,370</td>
      <td>2095</td>
      <td>0.7</td>
      <td>153.3</td>
      <td>5906.4</td>
      <td>-225</td>
      <td>5</td>
      <td>
        Declassified as a planet in 2006, but this
        <a
          href="https://www.usatoday.com/story/tech/2014/10/02/pluto-planet-solar-system/16578959/"
          >remains controversial</a
        >.
      </td>
    </tr>
  </tbody>
</table>
```

```css hidden
table {
  border-collapse: collapse;
  border: 2px solid black;
}

th,
td {
  padding: 5px;
  border: 1px solid black;
}
```

{{EmbedLiveSample("How_does_a_table_work", 100, 560)}}

Khi được triển khai đúng cách, các bảng HTML được xử lý tốt bởi các công cụ hỗ trợ tiếp cận như trình đọc màn hình, vì vậy bảng HTML thành công sẽ nâng cao trải nghiệm của cả người dùng có thị lực và người dùng khiếm thị.

### Tạo kiểu bảng

Bạn cũng có thể [xem ví dụ dữ liệu hành tinh trực tiếp](https://mdn.github.io/learning-area/html/tables/assessment-finished/planets-data.html) trên GitHub! Một điều bạn sẽ nhận thấy là bảng trông có vẻ dễ đọc hơn ở đó — điều này là vì bảng bạn thấy ở trên trang này có kiểu tối thiểu, trong khi phiên bản GitHub có CSS đáng kể hơn được áp dụng.

Đừng ảo tưởng; để các bảng hiệu quả trên web, bạn cần cung cấp một số thông tin tạo kiểu với [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), cũng như cấu trúc vững chắc với HTML. Trong bài học này, chúng ta tập trung vào phần HTML; bạn sẽ tìm hiểu về tạo kiểu bảng sau này, trong bài học [Tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables) của chúng ta.

Chúng ta sẽ không tập trung vào CSS trong mô-đun này, nhưng chúng tôi đã cung cấp một CSS stylesheet tối thiểu để bạn sử dụng sẽ làm cho bảng của bạn dễ đọc hơn so với mặc định bạn nhận được khi không có bất kỳ kiểu nào. Bạn có thể tìm thấy [stylesheet ở đây](https://github.com/mdn/learning-area/blob/main/html/tables/basic/minimal-table.css), và bạn cũng có thể tìm thấy [mẫu HTML](https://github.com/mdn/learning-area/blob/main/html/tables/basic/blank-template.html) áp dụng stylesheet — những thứ này cùng nhau sẽ cung cấp cho bạn một điểm xuất phát tốt để thử nghiệm với bảng HTML.

### Khi nào nên tránh bảng HTML?

Bảng HTML nên được sử dụng cho dữ liệu dạng bảng (thông tin dễ làm việc trong hàng và cột) — đây là mục đích thiết kế của chúng. Thật không may, nhiều người đã từng sử dụng bảng HTML để bố cục trang web, ví dụ như một hàng để chứa phần đầu trang, một hàng để chứa mỗi cột nội dung, một hàng để chứa phần cuối trang, v.v. Kỹ thuật này đã được sử dụng trong quá khứ vì hỗ trợ CSS trên các trình duyệt từng rất hạn chế hơn. Các trình duyệt hiện đại có hỗ trợ CSS vững chắc nên bố cục dựa trên bảng không còn cần thiết nữa. Bố cục bảng hiện cực kỳ hiếm, nhưng bạn vẫn có thể thấy chúng ở một số nơi trên web.

Tóm lại, việc sử dụng bảng cho bố cục thay vì [kỹ thuật bố cục CSS](/en-US/docs/Learn_web_development/Core/CSS_layout) là ý tưởng tồi. Các lý do chính như sau:

1. **Bảng bố cục làm giảm khả năng tiếp cận cho người dùng khiếm thị**: [Trình đọc màn hình](/en-US/docs/Learn_web_development/Core/Accessibility/Tooling#screen_readers), được sử dụng bởi người mù, diễn giải các thẻ tồn tại trong trang HTML và đọc to nội dung cho người dùng. Vì bảng không phải là công cụ phù hợp cho bố cục, và đánh dấu phức tạp hơn so với các kỹ thuật bố cục CSS, đầu ra của trình đọc màn hình sẽ gây nhầm lẫn cho người dùng của họ.
2. **Bảng tạo ra mã lộn xộn**: Như đã đề cập ở trên, bố cục bảng thường liên quan đến các cấu trúc đánh dấu phức tạp hơn so với các kỹ thuật bố cục phù hợp. Điều này có thể dẫn đến mã khó viết, bảo trì và gỡ lỗi hơn.
3. **Bảng không tự động responsive**: Khi bạn sử dụng các container bố cục phù hợp (như {{htmlelement("header")}}, {{htmlelement("section")}}, {{htmlelement("article")}}, hoặc {{htmlelement("div")}}), chiều rộng mặc định của chúng là 100% phần tử cha. Mặt khác, bảng được điều chỉnh theo nội dung theo mặc định, vì vậy cần các biện pháp bổ sung để làm cho tạo kiểu bố cục bảng hoạt động hiệu quả trên nhiều thiết bị.

## Tạo bảng đầu tiên của bạn

Chúng ta đã nói đủ về lý thuyết bảng, vì vậy hãy đi vào một ví dụ thực tế và giúp bạn xây dựng một bảng đơn giản.

1. Trước hết, hãy tạo một bản sao của [blank-template.html](https://github.com/mdn/learning-area/blob/main/html/tables/basic/blank-template.html) và [minimal-table.css](https://github.com/mdn/learning-area/blob/main/html/tables/basic/minimal-table.css) trong một thư mục mới trên máy tính cục bộ của bạn. Mẫu HTML đã chứa phần tử `<link>` để áp dụng CSS vào HTML, vì vậy bạn không cần lo lắng về điều đó.
2. Nội dung của mọi bảng được bao gồm trong hai thẻ này: **[`<table></table>`](/en-US/docs/Web/HTML/Reference/Elements/table)**. Thêm những thẻ này vào trong body của HTML của bạn.
3. Container nhỏ nhất trong bảng là một ô bảng, được tạo ra bằng phần tử **[`<td>`](/en-US/docs/Web/HTML/Reference/Elements/td)** ("td" là viết tắt của "table data"). Thêm phần sau vào trong thẻ bảng của bạn:

   ```html
   <td>Hi, I'm your first cell.</td>
   ```

4. Nếu chúng ta muốn một hàng có bốn ô, chúng ta cần sao chép những thẻ này ba lần. Cập nhật nội dung bảng của bạn để trông như sau:

   ```html
   <td>Hi, I'm your first cell.</td>
   <td>I'm your second cell.</td>
   <td>I'm your third cell.</td>
   <td>I'm your fourth cell.</td>
   ```

Như bạn sẽ thấy, các ô không được đặt bên dưới nhau, thay vào đó chúng tự động căn chỉnh với nhau trên cùng một hàng. Mỗi phần tử `<td>` tạo ra một ô và cùng nhau chúng tạo thành hàng đầu tiên. Mỗi ô chúng ta thêm làm cho hàng dài hơn.

Để dừng hàng này khỏi việc phát triển và bắt đầu đặt các ô tiếp theo trên hàng thứ hai, chúng ta cần sử dụng phần tử **[`<tr>`](/en-US/docs/Web/HTML/Reference/Elements/tr)** ('tr' là viết tắt của 'table row'). Hãy xem xét điều này ngay bây giờ.

1. Đặt bốn ô bạn đã tạo bên trong thẻ `<tr>`, như sau:

   ```html
   <tr>
     <td>Hi, I'm your first cell.</td>
     <td>I'm your second cell.</td>
     <td>I'm your third cell.</td>
     <td>I'm your fourth cell.</td>
   </tr>
   ```

2. Bây giờ bạn đã tạo một hàng, hãy thử tạo thêm một hoặc hai hàng — mỗi hàng cần được bọc trong phần tử `<tr>` bổ sung, với mỗi ô chứa trong một `<td>`.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<table>
  <tr>
    <td>Hi, I'm your first cell.</td>
    <td>I'm your second cell.</td>
    <td>I'm your third cell.</td>
    <td>I'm your fourth cell.</td>
  </tr>

  <tr>
    <td>Second row, first cell.</td>
    <td>Cell 2.</td>
    <td>Cell 3.</td>
    <td>Cell 4.</td>
  </tr>
</table>
```

Bạn cũng có thể tìm thấy mã này trên GitHub tại [simple-table.html](https://github.com/mdn/learning-area/blob/main/html/tables/basic/simple-table.html) ([xem nó chạy trực tiếp cũng](https://mdn.github.io/learning-area/html/tables/basic/simple-table.html)).

</details>

## Thêm tiêu đề với phần tử \<th>

Bây giờ hãy chú ý đến tiêu đề bảng — các ô đặc biệt nằm ở đầu hàng hoặc cột và xác định loại dữ liệu mà hàng hoặc cột đó chứa (ví dụ: xem các ô "Person" và "Age" trong ví dụ đầu tiên được hiển thị trong bài viết này). Để minh họa lý do chúng hữu ích, hãy xem ví dụ bảng sau. Đầu tiên là mã nguồn:

```html live-sample___table-headers
<table>
  <tr>
    <td>&nbsp;</td>
    <td>Knocky</td>
    <td>Flor</td>
    <td>Ella</td>
    <td>Juan</td>
  </tr>
  <tr>
    <td>Breed</td>
    <td>Jack Russell</td>
    <td>Poodle</td>
    <td>Streetdog</td>
    <td>Cocker Spaniel</td>
  </tr>
  <tr>
    <td>Age</td>
    <td>16</td>
    <td>9</td>
    <td>10</td>
    <td>5</td>
  </tr>
  <tr>
    <td>Owner</td>
    <td>Mother-in-law</td>
    <td>Me</td>
    <td>Me</td>
    <td>Sister-in-law</td>
  </tr>
  <tr>
    <td>Eating Habits</td>
    <td>Eats everyone's leftovers</td>
    <td>Nibbles at food</td>
    <td>Hearty eater</td>
    <td>Will eat till he explodes</td>
  </tr>
</table>
```

```css hidden live-sample___table-headers
table {
  border-collapse: collapse;
}
td,
th {
  border: 1px solid black;
  padding: 10px 20px;
}
```

Và đây là bảng được hiển thị thực sự:

{{EmbedLiveSample("table-headers", "", "250")}}

Vấn đề ở đây là, mặc dù bạn có thể hiểu được những gì đang xảy ra, nhưng không dễ đối chiếu dữ liệu như có thể. Nếu các tiêu đề cột và hàng nổi bật theo một cách nào đó, sẽ tốt hơn nhiều.

### Thêm tiêu đề vào bảng dogs

Bây giờ chúng tôi muốn bạn thử cải thiện ví dụ bảng dogs bằng cách thêm một số tiêu đề.

1. Trước tiên, hãy tạo bản sao cục bộ của các tệp [dogs-table.html](https://github.com/mdn/learning-area/blob/main/html/tables/basic/dogs-table.html) và [minimal-table.css](https://github.com/mdn/learning-area/blob/main/html/tables/basic/minimal-table.css) trong một thư mục mới trên máy tính cục bộ của bạn.
2. Để nhận ra tiêu đề bảng là tiêu đề, cả về mặt hình ảnh và ngữ nghĩa, bạn có thể sử dụng phần tử **[`<th>`](/en-US/docs/Web/HTML/Reference/Elements/th)** ("th" là viết tắt của "table header"). Nó hoạt động theo cách hoàn toàn giống như `<td>`, ngoại trừ việc nó biểu thị tiêu đề, không phải ô thông thường. Vào HTML của bạn và thay đổi tất cả các phần tử `<td>` bao quanh các tiêu đề bảng thành phần tử `<th>`.
3. Lưu HTML của bạn và tải nó trong trình duyệt, và bạn sẽ thấy rằng các tiêu đề bây giờ trông giống tiêu đề.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<table>
  <tr>
    <td>&nbsp;</td>
    <th>Knocky</th>
    <th>Flor</th>
    <th>Ella</th>
    <th>Juan</th>
  </tr>
  <tr>
    <th>Breed</th>
    <td>Jack Russell</td>
    <td>Poodle</td>
    <td>Streetdog</td>
    <td>Cocker Spaniel</td>
  </tr>
  <tr>
    <th>Age</th>
    <td>16</td>
    <td>9</td>
    <td>10</td>
    <td>5</td>
  </tr>
  <tr>
    <th>Owner</th>
    <td>Mother-in-law</td>
    <td>Me</td>
    <td>Me</td>
    <td>Sister-in-law</td>
  </tr>
  <tr>
    <th>Eating Habits</th>
    <td>Eats everyone's leftovers</td>
    <td>Nibbles at food</td>
    <td>Hearty eater</td>
    <td>Will eat till he explodes</td>
  </tr>
</table>
```

Bạn cũng có thể tìm thấy mã này trên GitHub tại [dogs-table-fixed.html](https://github.com/mdn/learning-area/blob/main/html/tables/basic/dogs-table-fixed.html) ([xem nó chạy trực tiếp cũng](https://mdn.github.io/learning-area/html/tables/basic/dogs-table-fixed.html)).

</details>

### Tại sao tiêu đề lại hữu ích?

Chúng ta đã trả lời một phần câu hỏi này — dễ dàng hơn để tìm dữ liệu bạn đang tìm kiếm khi các tiêu đề nổi bật rõ ràng, và thiết kế nói chung trông đẹp hơn.

> [!NOTE]
> Tiêu đề bảng có một số kiểu mặc định — chúng in đậm và căn giữa ngay cả khi bạn không thêm kiểu của riêng mình vào bảng, để giúp chúng nổi bật.

Tiêu đề bảng cũng có thêm một lợi ích — cùng với thuộc tính `scope` (mà chúng ta sẽ tìm hiểu trong bài viết tiếp theo), chúng cho phép bạn làm cho bảng có thể tiếp cận hơn bằng cách liên kết mỗi tiêu đề với tất cả dữ liệu trong cùng hàng hoặc cột. Các trình đọc màn hình sau đó có thể đọc to toàn bộ hàng hoặc cột dữ liệu cùng một lúc, điều này khá hữu ích.

## Cho phép ô kéo dài nhiều hàng và cột

Đôi khi chúng ta muốn các ô kéo dài nhiều hàng hoặc cột. Hãy lấy ví dụ đơn giản sau, cho thấy tên của các động vật phổ biến. Trong một số trường hợp, chúng ta muốn hiển thị tên của cá thể đực và cái bên cạnh tên động vật. Đôi khi chúng ta không muốn, và trong những trường hợp như vậy, chúng ta chỉ muốn tên động vật kéo dài toàn bộ bảng.

Đánh dấu ban đầu trông như thế này:

```html live-sample___multiple-rows-columns
<table>
  <tr>
    <th>Animals</th>
  </tr>
  <tr>
    <th>Hippopotamus</th>
  </tr>
  <tr>
    <th>Horse</th>
    <td>Mare</td>
  </tr>
  <tr>
    <td>Stallion</td>
  </tr>
  <tr>
    <th>Crocodile</th>
  </tr>
  <tr>
    <th>Chicken</th>
    <td>Hen</td>
  </tr>
  <tr>
    <td>Rooster</td>
  </tr>
</table>
```

```css hidden live-sample___multiple-rows-columns
table {
  border-collapse: collapse;
}
td,
th {
  border: 1px solid black;
  padding: 10px 20px;
}
```

Nhưng đầu ra không cho chúng ta những gì chúng ta muốn:

{{EmbedLiveSample("multiple-rows-columns", "", "350")}}

### Sửa bố cục với `rowspan` và `colspan`

Chúng ta cần một cách để làm cho "Animals", "Hippopotamus", và "Crocodile" kéo dài hai cột, và "Horse" và "Chicken" kéo dài xuống hai hàng. May mắn thay, tiêu đề và ô bảng có các thuộc tính `colspan` và `rowspan`, cho phép chúng ta thực hiện những điều đó. Cả hai đều nhận giá trị số không đơn vị, bằng số hàng hoặc cột bạn muốn kéo dài. Ví dụ, `colspan="2"` làm cho một ô kéo dài hai cột.

Hãy sử dụng `colspan` và `rowspan` để cải thiện bảng này.

1. Đầu tiên, hãy tạo bản sao cục bộ của các tệp [animals-table.html](https://github.com/mdn/learning-area/blob/main/html/tables/basic/animals-table.html) và [minimal-table.css](https://github.com/mdn/learning-area/blob/main/html/tables/basic/minimal-table.css) trong một thư mục mới trên máy tính cục bộ của bạn. HTML chứa cùng ví dụ animals mà bạn đã thấy ở trên.
2. Tiếp theo, sử dụng `colspan` để làm cho "Animals", "Hippopotamus", và "Crocodile" kéo dài hai cột.
3. Cuối cùng, sử dụng `rowspan` để làm cho "Horse" và "Chicken" kéo dài hai hàng.
4. Lưu và mở mã của bạn trong trình duyệt để xem sự cải thiện.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<table>
  <tr>
    <th colspan="2">Animals</th>
  </tr>
  <tr>
    <th colspan="2">Hippopotamus</th>
  </tr>
  <tr>
    <th rowspan="2">Horse</th>
    <td>Mare</td>
  </tr>
  <tr>
    <td>Stallion</td>
  </tr>
  <tr>
    <th colspan="2">Crocodile</th>
  </tr>
  <tr>
    <th rowspan="2">Chicken</th>
    <td>Hen</td>
  </tr>
  <tr>
    <td>Rooster</td>
  </tr>
</table>
```

Bạn cũng có thể tìm thấy mã này trên GitHub tại [animals-table-fixed.html](https://github.com/mdn/learning-area/blob/main/html/tables/basic/animals-table-fixed.html) ([xem nó chạy trực tiếp cũng](https://mdn.github.io/learning-area/html/tables/basic/animals-table-fixed.html)).

</details>

## Nhóm cột với `<colgroup>` và `<col>`

Có một cách để nhắm mục tiêu toàn bộ cột bảng như một thực thể duy nhất, ví dụ khi áp dụng kiểu cho bảng (mà bạn sẽ tìm hiểu sau, trong [Tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)). Khi bạn có thêm kinh nghiệm tạo bảng HTML, bạn sẽ thấy rằng việc áp dụng màu nền, ví dụ, cho mỗi ô trong một cột là khó hơn bạn nghĩ. Các phần tử {{htmlelement("colgroup")}} và {{htmlelement("col")}} cung cấp giải pháp cho vấn đề này.

Phần tử `<colgroup>` nên được bao gồm như con của bảng, ngay sau phần tử `<table>` mở. Bên trong phần tử `<colgroup>`, bạn có thể bao gồm một hoặc nhiều phần tử `<col>`, đại diện cho các nhóm cột. Phần tử `<col>` có thể bao gồm thuộc tính `span` cho biết số cột trong nhóm đó. Nó cũng có thể bao gồm các thuộc tính toàn cục như `style` (nếu bạn muốn nhắm mục tiêu nhóm với kiểu nội tuyến) hoặc `class` (nếu bạn muốn nhắm mục tiêu nhóm đó với CSS hoặc JavaScript bằng tên lớp). Các phần tử `<col>` đại diện cho các cột bảng từ đầu các cột, ví dụ từ phía bên trái của bảng được viết theo ngôn ngữ từ trái sang phải như tiếng Anh.

Hãy xem một ví dụ để hiển thị ý của chúng ta. Bảng sau cho thấy thời gian biểu của một trường:

```html live-sample___colgroup-col
<h1>School language timetable</h1>

<table>
  <colgroup>
    <col span="2" />
    <col class="column-background" />
    <col class="column-fixed-width" />
    <col class="column-background" />
    <col class="column-background-border" />
    <col span="2" class="column-fixed-width" />
  </colgroup>
  <tr>
    <td>&nbsp;</td>
    <th>Mon</th>
    <th>Tues</th>
    <th>Wed</th>
    <th>Thurs</th>
    <th>Fri</th>
    <th>Sat</th>
    <th>Sun</th>
  </tr>
  <tr>
    <th>1st period</th>
    <td>English</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>German</td>
    <td>Dutch</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>2nd period</th>
    <td>English</td>
    <td>English</td>
    <td>&nbsp;</td>
    <td>German</td>
    <td>Dutch</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>3rd period</th>
    <td>&nbsp;</td>
    <td>German</td>
    <td>&nbsp;</td>
    <td>German</td>
    <td>Dutch</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>4th period</th>
    <td>&nbsp;</td>
    <td>English</td>
    <td>&nbsp;</td>
    <td>English</td>
    <td>Dutch</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
```

Trong bảng này, có tám cột. Hãy nhìn vào cấu trúc `<colgroup>` và `<col>` kỹ hơn để hiển thị cách nó ảnh hưởng đến chúng:

```html
<colgroup>
  <col span="2" />
  <col class="column-background" />
  <col class="column-fixed-width" />
  <col class="column-background" />
  <col class="column-background-border" />
  <col span="2" class="column-fixed-width" />
</colgroup>
```

Nhìn vào các phần tử `<col>`:

- Cái đầu tiên có `span="2"` được đặt trên nó, vì vậy nó đại diện cho cột thứ nhất _và_ thứ hai từ bên trái bảng. Chúng ta không nhắm mục tiêu các cột này với bất kỳ kiểu nào, nhưng chúng ta cần bao gồm nó để có thể nhắm mục tiêu các cột tiếp theo.
- Cái thứ hai và thứ tư không có thuộc tính `span` được đặt, vì vậy chúng sẽ đại diện cho một cột — cột thứ ba và thứ năm trong những trường hợp này. Chúng có `class` của `column-background` được áp dụng.
- Cái thứ ba không có thuộc tính `span` được đặt, và có `class` của `column-fixed-width` được áp dụng. Nó đại diện cho cột thứ tư.
- Cái thứ năm không có thuộc tính `span` được đặt, và có `class` của `column-background-border` được áp dụng. Nó đại diện cho cột thứ sáu.
- Cái thứ sáu có `span="2"` được đặt trên nó, và có `class` của `column-fixed-width` được áp dụng. Nó đại diện cho cột thứ bảy và thứ tám.

Chúng ta đã ẩn hầu hết CSS cho ví dụ này, nhưng chúng ta đang cho bạn xem các quy tắc áp dụng kiểu cho các phần tử `<col>` với các lớp `column-background`, `column-fixed-width`, và `column-background-border` được đặt trên chúng:

```css hidden live-sample___colgroup-col
html {
  font-family: sans-serif;
}

body {
  margin: 0 20px;
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

td {
  text-align: center;
}
```

```css live-sample___colgroup-col
.column-background {
  background-color: #97db9a;
}

.column-fixed-width {
  width: 40px;
}

.column-background-border {
  background-color: #dcc48e;
  border: 4px solid #c1437a;
}
```

- Các phần tử `<col>` với lớp `column-background` có màu nền đặc được đặt trên chúng.
- Các phần tử `<col>` với lớp `column-fixed-width` có chiều rộng cố định hẹp được đặt trên chúng.
- Phần tử `<col>` với lớp `column-background-border` có màu nền đặc và đường viền dày được đặt trên nó.

Bạn không cần lo lắng về cách CSS hoạt động bây giờ; bạn sẽ tìm hiểu chi tiết sau trong mô-đun [Kiến thức cơ bản về tạo kiểu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics) của chúng ta.

Hãy xem mã trên được hiển thị như thế nào:

{{embedlivesample("colgroup-col", "100%", 400)}}

Lưu ý cách các cột khác nhau nhận kiểu được chỉ định trong các lớp.

> [!NOTE]
> Mặc dù `<colgroup>` và `<col>` chủ yếu hỗ trợ tạo kiểu, chúng là tính năng HTML, do đó chúng ta đã đề cập đến chúng ở đây thay vì trong các mô-đun CSS. Cũng công bằng khi nói rằng chúng là tính năng _hạn chế_ — như được hiển thị trên [trang tham chiếu `<colgroup>`](/en-US/docs/Web/HTML/Reference/Elements/colgroup#usage_notes), chỉ một tập hợp con hạn chế của kiểu có thể được áp dụng cho phần tử `<col>`, và hầu hết các cài đặt khác đã có sẵn trong lịch sử đã bị xóa bỏ (loại bỏ, hoặc được đánh dấu để loại bỏ).

## Tóm tắt nhanh các khái niệm bảng

Nội dung nhúng sau đây từ Scrimba<sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp bài học tương tác tóm tắt hầu hết các kỹ thuật được đề cập trong bài viết này. Hãy xem để ôn lại các điểm chính và luyện tập thêm.

<mdn-scrim-inline url="https://scrimba.com/frontend-path-c0j/~03s" scrimtitle="HTML tables"></scrim-inline>

## Tóm tắt

Điều đó kết thúc kiến thức cơ bản về bảng HTML. Trong bài viết tiếp theo, chúng ta sẽ xem xét một số tính năng bổ sung có thể được sử dụng để làm cho bảng HTML có thể tiếp cận hơn với người khiếm thị.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Splash_page", "Learn_web_development/Core/Structuring_content/Table_accessibility", "Learn_web_development/Core/Structuring_content")}}
