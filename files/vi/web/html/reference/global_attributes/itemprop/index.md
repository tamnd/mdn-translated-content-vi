---
title: HTML itemprop global attribute
short-title: itemprop
slug: Web/HTML/Reference/Global_attributes/itemprop
page-type: html-attribute
spec-urls: https://html.spec.whatwg.org/multipage/microdata.html#names:-the-itemprop-attribute
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`itemprop`** được dùng để thêm các thuộc tính vào một mục. Mọi phần tử HTML đều có thể được chỉ định thuộc tính `itemprop`, và một `itemprop` bao gồm một cặp tên-giá trị. Mỗi cặp tên-giá trị được gọi là một **thuộc tính**, và một nhóm một hoặc nhiều thuộc tính tạo thành một **mục**. Các giá trị thuộc tính có thể là chuỗi hoặc URL và có thể được liên kết với một loạt các phần tử bao gồm {{HTMLElement("audio")}}, {{HTMLElement("embed")}}, {{HTMLElement("iframe")}}, {{HTMLElement("img")}}, {{HTMLElement("link")}}, {{HTMLElement("object")}}, {{HTMLElement("source")}}, {{HTMLElement("track")}}, và {{HTMLElement("video")}}.

## Ví dụ

Ví dụ dưới đây hiển thị nguồn cho một tập hợp các phần tử được đánh dấu với các thuộc tính `itemprop`, tiếp theo là bảng hiển thị dữ liệu có cấu trúc kết quả.

### HTML

```html
<div itemscope itemtype="http://schema.org/Movie">
  <h1 itemprop="name">Avatar</h1>
  <span>
    Director:
    <span itemprop="director">James Cameron</span>
    (born August 16, 1954)
  </span>
  <span itemprop="genre">Science fiction</span>
  <a href="../movies/avatar-theatrical-trailer.html" itemprop="trailer">
    Trailer
  </a>
</div>
```

### Dữ liệu có cấu trúc

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="2"> </td>
      <th colspan="2"><strong>Mục</strong></th>
    </tr>
    <tr>
      <th><strong>tên itemprop</strong></th>
      <th><strong>giá trị itemprop</strong></th>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Avatar</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>director</td>
      <td>James Cameron</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>genre</td>
      <td>Science fiction</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>trailer</td>
      <td>../movies/avatar-theatrical-trailer.html</td>
    </tr>
  </tbody>
</table>

## Thuộc tính

Các thuộc tính có giá trị là chuỗi hoặc URL. Khi giá trị chuỗi là URL, nó được biểu đạt bằng phần tử {{HTMLElement("a")}} và thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href), phần tử {{HTMLElement("img")}} và thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src), hoặc các phần tử khác liên kết đến hoặc nhúng tài nguyên bên ngoài.

### Ba thuộc tính với giá trị là chuỗi

```html
<div itemscope>
  <p>My name is <span itemprop="name">Neil</span>.</p>
  <p>My band is called <span itemprop="band">Four Parts Water</span>.</p>
  <p>I am <span itemprop="nationality">British</span>.</p>
</div>
```

### Một thuộc tính, "image", có giá trị là URL

```html
<div itemscope>
  <img itemprop="image" src="google-logo.png" alt="Google" />
</div>
```

Khi giá trị chuỗi không thể đọc và hiểu dễ dàng bởi con người (ví dụ: một chuỗi dài các số và chữ cái), nó có thể được hiển thị bằng thuộc tính value của phần tử data, với phiên bản dễ hiểu hơn cho con người được đưa vào nội dung của phần tử (không phải là một phần của dữ liệu có cấu trúc - xem ví dụ bên dưới).

### Một mục với thuộc tính có giá trị là ID sản phẩm

ID không thân thiện với người dùng, vì vậy tên sản phẩm được sử dụng thay thế.

```html
<h1 itemscope>
  <data itemprop="product-id" value="9678AOU879">The Instigator 2000</data>
</h1>
```

Đối với dữ liệu số, phần tử meter và thuộc tính value của nó có thể được sử dụng.

### Một phần tử meter

```html
<div itemscope itemtype="http://schema.org/Product">
  <span itemprop="name">Panasonic White 60L Refrigerator</span>
  <img src="panasonic-fridge-60l-white.jpg" alt="" />
  <div
    itemprop="aggregateRating"
    itemscope
    itemtype="http://schema.org/AggregateRating">
    <meter itemprop="ratingValue" min="0" value="3.5" max="5">
      Rated 3.5/5
    </meter>
    (based on <span itemprop="reviewCount">11</span>
    customer reviews)
  </div>
</div>
```

Tương tự, đối với dữ liệu liên quan đến ngày và giờ, phần tử time và thuộc tính datetime của nó có thể được sử dụng.

### Một mục với một thuộc tính, "birthday", có giá trị là ngày

```html
<div itemscope>
  I was born on
  <time itemprop="birthday" datetime="1984-05-10">May 10th 1984</time>.
</div>
```

Các thuộc tính cũng có thể là các nhóm cặp tên-giá trị, bằng cách đặt thuộc tính itemscope trên phần tử khai báo thuộc tính. Mỗi giá trị có thể là chuỗi hoặc nhóm cặp tên-giá trị (tức là một mục).

### Một mục ngoài đại diện cho người, và một mục trong đại diện cho ban nhạc

```html
<div itemscope>
  <p>Name: <span itemprop="name">Amanda</span></p>
  <p>
    Band:
    <span itemprop="band" itemscope>
      <span itemprop="name">Jazz Band</span>
      (<span itemprop="size">12</span> players)
    </span>
  </p>
</div>
```

Mục ngoài ở trên có hai thuộc tính, "name" và "band". "name" là "Amanda", và "band" là một mục theo đúng nghĩa của nó, với hai thuộc tính, "name" và "size". "name" của ban nhạc là "Jazz Band", và "size" là "12". Mục ngoài trong ví dụ này là mục microdata cấp cao nhất. Các mục không thuộc về các mục khác được gọi là mục microdata cấp cao nhất.

### Tất cả các thuộc tính được tách riêng khỏi các mục của chúng

Ví dụ này giống với ví dụ trước, nhưng tất cả các thuộc tính được tách riêng khỏi các mục của chúng.

```html
<div itemscope id="amanda" itemref="a b"></div>
<p id="a">Name: <span itemprop="name">Amanda</span></p>
<div id="b" itemprop="band" itemscope itemref="c"></div>
<div id="c">
  <p>Band: <span itemprop="name">Jazz Band</span></p>
  <p>Size: <span itemprop="size">12</span> players</p>
</div>
```

Điều này cho kết quả tương tự như ví dụ trước. Mục đầu tiên có hai thuộc tính, "name" được đặt thành "Amanda", và "band" được đặt thành mục khác. Mục thứ hai đó có hai thuộc tính bổ sung, "name" được đặt thành "Jazz Band", và "size" được đặt thành "12".

Một mục có thể có nhiều thuộc tính có cùng tên và các giá trị khác nhau.

### Kem với hai hương vị

```html
<div itemscope>
  <p>Flavors in my favorite ice cream:</p>
  <ul>
    <li itemprop="flavor">Lemon sorbet</li>
    <li itemprop="flavor">Apricot sorbet</li>
  </ul>
</div>
```

Điều này cho kết quả là một mục với hai thuộc tính, cả hai đều có tên "flavor" và các giá trị "Lemon sorbet" và "Apricot sorbet".

Một phần tử giới thiệu thuộc tính cũng có thể giới thiệu nhiều thuộc tính cùng một lúc, để tránh trùng lặp khi một số thuộc tính có cùng giá trị.

### Một mục với hai thuộc tính, "favorite-color" và "favorite-fruit", cả hai đều được đặt thành giá trị "orange"

```html
<div itemscope>
  <span
    itemprop="favorite-color
    favorite-fruit"
    >orange
  </span>
</div>
```

> [!NOTE]
> Không có mối quan hệ nào giữa microdata và nội dung của tài liệu nơi microdata được đánh dấu.

### Cùng dữ liệu có cấu trúc được đánh dấu theo hai cách khác nhau

Không có sự khác biệt ngữ nghĩa giữa hai ví dụ sau

```html
<figure>
  <img src="castle.jpeg" />
  <figcaption>
    <span itemscope><span itemprop="name">The Castle</span></span> (1986)
  </figcaption>
</figure>
```

```html
<span itemscope><meta itemprop="name" content="The Castle" /></span>
<figure>
  <img src="castle.jpeg" />
  <figcaption>The Castle (1986)</figcaption>
</figure>
```

Cả hai đều có một hình ảnh với chú thích, và cả hai, hoàn toàn không liên quan đến hình ảnh, đều có một mục với cặp tên-giá trị với tên "name" và giá trị "The Castle". Sự khác biệt duy nhất là nếu người dùng kéo figcaption ra khỏi tài liệu, mục đó sẽ được đưa vào dữ liệu kéo và thả. Hình ảnh liên kết với mục sẽ không được đưa vào.

## Tên và giá trị

Một thuộc tính là tập hợp không có thứ tự của các token duy nhất phân biệt chữ hoa chữ thường và đại diện cho các cặp tên-giá trị. Giá trị thuộc tính phải có ít nhất một token. Trong ví dụ bên dưới, mỗi ô dữ liệu là một token.

### Ví dụ tên

<table class="standard-table">
  <thead>
    <tr>
      <th rowspan="2" scope="col"> </th>
      <th colspan="2" scope="col">Mục</th>
    </tr>
    <tr>
      <th scope="col"><strong>tên</strong> itemprop</th>
      <th scope="col"><strong>giá trị</strong> itemprop</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>itemprop</th>
      <td>country</td>
      <td>Ireland</td>
    </tr>
    <tr>
      <th>itemprop</th>
      <td>Option</td>
      <td>2</td>
    </tr>
    <tr>
      <th>itemprop</th>
      <td>https://www.flickr.com/photos/nlireland/6992065114/</td>
      <td>Ring of Kerry</td>
    </tr>
    <tr>
      <th>itemprop</th>
      <td>img</td>
      <td>https://www.flickr.com/photos/nlireland/6992065114/</td>
    </tr>
    <tr>
      <th>itemprop</th>
      <td>website</td>
      <td>flickr</td>
    </tr>
    <tr>
      <th>itemprop</th>
      <td>(token)</td>
      <td>(token)</td>
    </tr>
  </tbody>
</table>

**Token** là chuỗi hoặc URL. Một mục được gọi là **mục có kiểu** nếu nó là URL. Nếu không, nó là chuỗi. Chuỗi không thể chứa dấu chấm hoặc dấu hai chấm (xem bên dưới).

1. Nếu mục là mục có kiểu thì phải là một trong:
   1. Tên thuộc tính đã được định nghĩa, hoặc
   2. URL hợp lệ, tham chiếu đến định nghĩa từ vựng, hoặc
   3. URL hợp lệ được sử dụng như tên thuộc tính mục độc quyền (tức là không được định nghĩa trong một đặc tả công khai), hoặc

2. Nếu mục không phải là mục có kiểu thì phải là:
   1. Chuỗi không chứa ký tự `.` (U+002E FULL STOP) và không có ký tự `:` (U+003A COLON) và được sử dụng như tên thuộc tính mục độc quyền (một lần nữa, không được định nghĩa trong một đặc tả công khai).

> [!NOTE]
> Các quy tắc trên không cho phép các ký tự ":" trong các giá trị không phải URL vì nếu không thì chúng không thể phân biệt với URL. Các giá trị có ký tự "." được dành riêng cho các phần mở rộng trong tương lai. Các ký tự khoảng trắng không được phép vì nếu không thì các giá trị sẽ được phân tích thành nhiều token.

## Giá trị

Giá trị thuộc tính của một cặp tên-giá trị được cho theo trường hợp đầu tiên khớp trong danh sách sau:

- Nếu phần tử có thuộc tính `itemscope`
  - Giá trị là **mục** được tạo bởi phần tử

- Nếu phần tử là phần tử `meta`
  - Giá trị là giá trị của thuộc tính `content` của phần tử

- Nếu phần tử là phần tử `audio`, `embed`, `iframe`, `img`, `source`, `track`, hoặc `video`
  - Giá trị là chuỗi URL kết quả từ việc phân tích giá trị thuộc tính src của phần tử so với tài liệu nút (một phần của [Microdata DOM API](/en-US/docs/Web/HTML/Guides/Microdata)) của phần tử tại thời điểm thuộc tính được đặt

- Nếu phần tử là phần tử `a`, `area`, hoặc `link`
  - Giá trị là chuỗi URL kết quả từ việc phân tích giá trị thuộc tính href của phần tử so với tài liệu nút của phần tử tại thời điểm thuộc tính được đặt

- Nếu phần tử là phần tử `object`
  - Giá trị là chuỗi URL kết quả từ việc phân tích giá trị thuộc tính data của phần tử so với tài liệu nút của phần tử tại thời điểm thuộc tính được đặt

- Nếu phần tử là phần tử `data`
  - Giá trị là giá trị của thuộc tính value của phần tử

- Nếu phần tử là phần tử `meter`
  - Giá trị là giá trị của thuộc tính `value` của phần tử

- Nếu phần tử là phần tử `time`
  - Giá trị là giá trị `datetime` của phần tử

Nếu không

- Giá trị là _textContent_ của phần tử.

Nếu giá trị của thuộc tính là `URL`, thuộc tính phải được chỉ định bằng phần tử thuộc tính URL. Các phần tử thuộc tính URL là `a`, `area`, `audio`, `embed`, `iframe`, `img`, `link`, `object`, `source`, `track`, và `video`.

### Thứ tự tên

Các tên không có thứ tự so với nhau, nhưng nếu một tên cụ thể có nhiều giá trị, chúng có thứ tự tương đối.

Trong ví dụ sau, thuộc tính "a" có giá trị "1" và "2", _theo thứ tự đó_, nhưng thuộc tính "a" đến trước thuộc tính "b" hay không thì không quan trọng.

```html
<div itemscope>
  <p itemprop="a">1</p>
  <p itemprop="a">2</p>
  <p itemprop="b">test</p>
</div>
```

Đây là một số ví dụ tương đương:

```html
<div itemscope>
  <p itemprop="b">test</p>
  <p itemprop="a">1</p>
  <p itemprop="a">2</p>
</div>
```

```html
<div itemscope>
  <p itemprop="a">1</p>
  <p itemprop="b">test</p>
  <p itemprop="a">2</p>
</div>
```

```html
<div id="x">
  <p itemprop="a">1</p>
</div>
<div itemscope itemref="x">
  <p itemprop="b">test</p>
  <p itemprop="a">2</p>
</div>
```

### Biểu diễn dữ liệu có cấu trúc cho một cuốn sách

Ví dụ này sử dụng các thuộc tính microdata để biểu diễn dữ liệu có cấu trúc sau:

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="4">itemscope</td>
      <td>itemtype: itemid</td>
      <td colspan="2">https://schema.org/Book: urn:isbn:0-374-22848-5</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>title</td>
      <td>Owls of the Eastern Ice</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>author</td>
      <td>Jonathan C Slaght</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>datePublished</td>
      <td>2020-08-04</td>
    </tr>
  </tbody>
</table>

#### HTML

```html
<dl
  itemscope
  itemtype="https://schema.org/Book"
  itemid="urn:isbn:0-374-22848-5<">
  <dt>Title</dt>
  <dd itemprop="title">Owls of the Eastern Ice</dd>
  <dt>Author</dt>
  <dd itemprop="author">Jonathan C Slaght</dd>
  <dt>Publication date</dt>
  <dd>
    <time itemprop="datePublished" datetime="2020-08-04">August 4 2020</time>
  </dd>
</dl>
```

#### Kết quả

{{EmbedLiveSample('Representing structured data for a book')}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Các thuộc tính toàn cục khác](/en-US/docs/Web/HTML/Reference/Global_attributes)
- Các thuộc tính toàn cục liên quan đến microdata khác:
  - [`itemid`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemid)
  - [`itemref`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemref)
  - [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope)
  - [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype)
