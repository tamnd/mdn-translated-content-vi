---
title: "Thách thức: Cấu trúc bảng dữ liệu hành tinh"
short-title: "Thách thức: Bảng dữ liệu hành tinh"
slug: Learn_web_development/Core/Structuring_content/Planet_data_table
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Table_accessibility", "Learn_web_development/Core/Structuring_content/HTML_forms", "Learn_web_development/Core/Structuring_content")}}

Trong thách thức này, chúng tôi cung cấp dữ liệu về các hành tinh trong hệ mặt trời của chúng ta. Nhiệm vụ của bạn là cấu trúc nó thành một bảng HTML có thể tiếp cận được.

## Điểm xuất phát

1. Tạo một thư mục mới ở vị trí phù hợp trên máy tính của bạn, đặt tên là `planet-data-table` (hoặc mở một trình soạn thảo trực tuyến và thực hiện các bước cần thiết để tạo dự án mới).
2. Lưu danh sách HTML sau vào một tệp trong thư mục của bạn có tên `index.html` (hoặc dán nó vào khung HTML của trình soạn thảo trực tuyến).

   ```html
   <!doctype html>
   <html lang="en-US">
     <head>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width" />
       <title>Planet data table</title>
       <link href="style.css" rel="stylesheet" type="text/css" />
     </head>
     <body>
       <h1>Planet data table</h1>
     </body>
   </html>
   ```

3. Lưu danh sách CSS sau vào một tệp trong thư mục của bạn có tên `style.css` (hoặc dán nó vào khung CSS của trình soạn thảo trực tuyến).

   ```css live-sample___planet-data-table
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

   .column-border {
     border: 2px solid black;
   }
   ```

4. Giữ dữ liệu sau đây để tiện sử dụng; bạn sẽ cần chuyển nó thành bảng dữ liệu HTML bên trong tệp HTML của mình.

   ```plain
   Rows

   Terrestrial planets

   Mercury 0.330 4,879 5427 3.7 4222.6 57.9 167 0 Closest to the Sun
   Venus 4.87 12,104 5243 8.9 2802.0 108.2 464 0
   Earth 5.97 12,756 5514 9.8 24.0 149.6 15 1 Our world
   Mars 0.642 6,792 3933 3.7 24.7 227.9 -65 2 The red planet

   Jovian planets

   Gas giants

   Jupiter 1898 142,984 1326 23.1 9.9 778.6 -110 67 The largest planet
   Saturn 568 120,536 687 9.0 10.7 1433.5 -140 62

   Ice giants

   Uranus 86.8 51,118 1271 8.7 17.2 2872.5 -195 27
   Neptune 102 49,528 1638 11.0 16.1 4495.1 -200 14

   Dwarf planets*

   Pluto 0.0146 2,370 2095 0.7 153.3 5906.4 -225 5 Declassified as a planet in 2006, but this <a href="http://www.usatoday.com/story/tech/2014/10/02/pluto-planet-solar-system/16578959/">remains controversial</a>.

   Columns

   Name
   Mass (10<sup>24</sup>kg)
   Diameter (km)
   Density (kg/m<sup>3</sup>)
   Gravity (m/s<sup>2</sup>)
   Length of day (hours)
   Distance from Sun (10<sup>6</sup>km)
   Mean temperature (°C)
   Number of moons
   Notes

   Caption

   Data about the planets of our solar system (Planetary facts taken from <a href="http://nssdc.gsfc.nasa.gov/planetary/factsheet/">Nasa's Planetary Fact Sheet - Metric</a>).
   ```

## Tóm tắt dự án

Bạn đang làm việc ở một trường học; hiện tại, học sinh của bạn đang học về các hành tinh trong hệ mặt trời của chúng ta, và bạn muốn cung cấp cho họ một tập dữ liệu dễ theo dõi để tra cứu các sự kiện và số liệu về các hành tinh. Một bảng dữ liệu HTML sẽ là lý tưởng — bạn cần lấy dữ liệu thô hiện có và chuyển đổi nó thành bảng, theo các bước dưới đây.

Tất cả dữ liệu bạn cần đều có trong danh sách dữ liệu ở trên. Nếu bạn gặp khó khăn trong việc hình dung dữ liệu, hãy xem ví dụ trực tiếp bên dưới, hoặc thử vẽ sơ đồ.

1. Bắt đầu bảng bằng cách cung cấp cho nó một vùng chứa bên ngoài, một tiêu đề bảng và một thân bảng. Bạn không cần footer bảng cho ví dụ này.
2. Thêm chú thích được cung cấp vào bảng của bạn.
3. Thêm một hàng vào tiêu đề bảng chứa tất cả các tiêu đề cột.
4. Tạo tất cả các hàng nội dung bên trong thân bảng, nhớ biến tất cả các tiêu đề hàng thành tiêu đề về mặt ngữ nghĩa.
5. Đảm bảo tất cả nội dung được đặt vào đúng ô — trong dữ liệu thô, mỗi hàng dữ liệu hành tinh được hiển thị bên cạnh hành tinh tương ứng.
6. Thêm các thuộc tính để liên kết rõ ràng các tiêu đề hàng và cột với các hàng, cột hoặc nhóm hàng mà chúng là tiêu đề.
7. Thêm [viền](/en-US/docs/Web/CSS/Reference/Properties/border) màu đen chỉ xung quanh cột chứa tất cả các tiêu đề hàng tên hành tinh. Thực hiện điều này bằng cách sử dụng cấu trúc `<colgroup>`/`<col>` phù hợp và kiểu lớp `.column-border` được cung cấp trong CSS.

## Gợi ý và mẹo

- Ô đầu tiên của hàng tiêu đề cần để trống, và trải dài hai cột.
- Các tiêu đề hàng nhóm (ví dụ: _Jovian planets_) nằm ở bên trái của các tiêu đề hàng tên hành tinh (ví dụ: _Saturn_) hơi khó để sắp xếp — bạn cần đảm bảo mỗi tiêu đề trải dài đúng số hàng và cột.
- Một cách liên kết tiêu đề với hàng/cột của chúng dễ hơn nhiều so với cách khác.

## Ví dụ

Bảng sẽ trông như sau sau khi được đánh dấu chính xác. Nếu bạn bị kẹt, hãy xem giải pháp bên dưới ví dụ trực tiếp.

{{embedlivesample("planet-data-table", "100%", 650)}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___planet-data-table
<h1>Planet data table</h1>

<table>
  <caption>
    Data about the planets of our solar system (Planetary facts taken from
    <a href="https://nssdc.gsfc.nasa.gov/planetary/factsheet/"
      >Nasa's Planetary Fact Sheet - Metric</a
    >).
  </caption>
  <colgroup>
    <col span="2" />
    <col class="column-border" />
    <col span="9" />
  </colgroup>
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
      <th rowspan="4" colspan="2" scope="rowgroup">Terrestrial planets</th>
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

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Table_accessibility", "Learn_web_development/Core/Structuring_content/HTML_forms", "Learn_web_development/Core/Structuring_content")}}
