---
title: HTML itemscope global attribute
short-title: itemscope
slug: Web/HTML/Reference/Global_attributes/itemscope
page-type: html-attribute
spec-urls: https://html.spec.whatwg.org/multipage/microdata.html#attr-itemscope
sidebar: htmlsidebar
---

**`itemscope`** là [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) Boolean xác định phạm vi của metadata liên quan. Việc chỉ định thuộc tính **`itemscope`** cho một phần tử sẽ tạo ra một mục mới, dẫn đến một số cặp tên-giá trị được liên kết với phần tử đó.

Một thuộc tính liên quan, [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype), được dùng để chỉ định URL hợp lệ của từ vựng (chẳng hạn như [schema.org](https://schema.org/)) mô tả mục và ngữ cảnh thuộc tính của nó. Trong mỗi ví dụ sau, từ vựng được lấy từ [schema.org](https://schema.org/).

Mọi phần tử HTML có thể được chỉ định thuộc tính `itemscope`. Một phần tử `itemscope` không có `itemtype` liên quan phải có `itemref` liên quan.

> [!NOTE]
> Tìm hiểu thêm về thuộc tính `itemtype` tại <https://schema.org/Thing>

## Ghi chú sử dụng

### Thuộc tính id của itemscope

Khi bạn chỉ định thuộc tính `itemscope` cho một phần tử, một mục mới được tạo ra. Mục bao gồm một nhóm cặp tên-giá trị. Đối với các phần tử có thuộc tính `itemscope` và `itemtype`, bạn cũng có thể chỉ định thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id). Bạn có thể sử dụng thuộc tính `id` để đặt định danh toàn cục cho mục mới. Định danh toàn cục cho phép mục liên quan đến các mục khác được tìm thấy trên các trang trên Web.

## Ví dụ

### Biểu diễn dữ liệu có cấu trúc cho phim

Ví dụ sau chỉ định `itemtype` là "http\://schema.org/Movie" và chỉ định bốn thuộc tính `itemprop` liên quan.

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="6">itemscope</td>
      <td>Itemtype</td>
      <td colspan="2">Movie</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>(tên itemprop)</td>
      <td>(giá trị itemprop)</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>director</td>
      <td>James Cameron</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>genre</td>
      <td>Science Fiction</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Avatar</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>Trailer</td>
      <td>https://youtu.be/0AY1XIkX7bY</td>
    </tr>
  </tbody>
</table>

```html
<div itemscope itemtype="https://schema.org/Movie">
  <h1 itemprop="name">Avatar</h1>
  <span>
    Director: <span itemprop="director">James Cameron</span> (born August 16,
    1954)
  </span>
  <span itemprop="genre">Science fiction</span>
  <a href="https://youtu.be/0AY1XIkX7bY" itemprop="trailer">Trailer</a>
</div>
```

### Biểu diễn dữ liệu có cấu trúc cho công thức nấu ăn

Có bốn thuộc tính `itemscope` trong ví dụ sau. Mỗi thuộc tính `itemscope` đặt phạm vi của thuộc tính `itemtype` tương ứng của nó. Các `itemtype`, `Recipe`, `AggregateRating`, và `NutritionInformation` trong ví dụ sau là một phần của dữ liệu có cấu trúc [schema.org](https://www.schema.org/) cho công thức nấu ăn, như được chỉ định bởi `itemtype` đầu tiên, `http://schema.org/Recipe`.

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="14">itemscope</td>
      <td>itemtype</td>
      <td colspan="2">Recipe</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Grandma's Holiday Apple Pie</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>image</td>
      <td>https://c1.staticflickr.com/1/30/42759561_8631e2f905_n.jpg</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>datePublished</td>
      <td>2022-11-05</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>description</td>
      <td>
        This is my grandmother's apple pie recipe. I like to add a dash of
        nutmeg.
      </td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>prepTime</td>
      <td>PT30M</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>cookTime</td>
      <td>PT1H</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>totalTime</td>
      <td>PT1H30M</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>recipeYield</td>
      <td>1 9" pie (8 servings)</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>recipeIngredient</td>
      <td>Thinly-sliced apples: 6 cups</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>recipeIngredient</td>
      <td>White sugar: 3/4 cup</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>recipeInstructions</td>
      <td>
        1. Cut and peel apples 2. Mix sugar and cinnamon. Use additional sugar
        for tart apples.
      </td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td colspan="2">author [Person]</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Carol Smith</td>
    </tr>
    <tr>
      <td rowspan="3">itemscope</td>
      <td>itemprop[itemtype]</td>
      <td colspan="2">aggregateRating [AggregateRating]</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>ratingValue</td>
      <td>4.0</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>reviewCount</td>
      <td>35</td>
    </tr>
    <tr>
      <td rowspan="4">itemscope</td>
      <td>itemprop[itemtype]</td>
      <td colspan="2">nutrition [NutritionInformation]</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>servingSize</td>
      <td>1 medium slice</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>calories</td>
      <td>250 cal</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>fatContent</td>
      <td>12 g</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Một công cụ hữu ích để trích xuất cấu trúc microdata từ HTML là [Rich Results Testing Tool](https://search.google.com/test/rich-results) của Google. Hãy thử nó trên HTML được hiển thị ở đây.

#### HTML

```html
<div itemscope itemtype="https://schema.org/Recipe">
  <h2 itemprop="name">Grandma's Holiday Apple Pie</h2>
  <img
    itemprop="image"
    src="https://c1.staticflickr.com/1/30/42759561_8631e2f905_n.jpg"
    width="50"
    height="50" />
  <p>
    By
    <span itemprop="author" itemscope itemtype="https://schema.org/Person">
      <span itemprop="name">Carol Smith</span>
    </span>
  </p>
  <p>
    Published:
    <time datetime="2022-11-05" itemprop="datePublished">
      November 5, 20022
    </time>
  </p>
  <span itemprop="description">
    This is my grandmother's apple pie recipe. I like to add a dash of nutmeg.
  </span>
  <br />
  <span
    itemprop="aggregateRating"
    itemscope
    itemtype="https://schema.org/AggregateRating">
    <span itemprop="ratingValue">4.0</span> stars based on
    <span itemprop="reviewCount">35</span> reviews
  </span>
  <br />
  Prep time: <time datetime="PT30M" itemprop="prepTime">30 min</time>
  <br />
  Cook time: <time datetime="PT1H" itemprop="cookTime">1 hour</time>
  <br />
  Total time: <time datetime="PT1H30M" itemprop="totalTime">1 hour 30 min</time>
  <br />
  Yield: <span itemprop="recipeYield">1 9" pie (8 servings)</span>
  <br />
  <span
    itemprop="nutrition"
    itemscope
    itemtype="https://schema.org/NutritionInformation">
    Serving size: <span itemprop="servingSize">1 medium slice</span><br />
    Calories per serving: <span itemprop="calories">250 cal</span><br />
    Fat per serving: <span itemprop="fatContent">12 g</span><br />
  </span>
  <p>
    Ingredients:<br />
    <span itemprop="recipeIngredient">Thinly-sliced apples: 6 cups<br /></span>
    <span itemprop="recipeIngredient">White sugar: 3/4 cup<br /></span>
    …
  </p>
  Directions: <br />
  <div itemprop="recipeInstructions">
    1. Cut and peel apples<br />
    2. Mix sugar and cinnamon. Use additional sugar for tart apples. <br />
    …
  </div>
</div>
```

#### Kết quả

{{EmbedLiveSample('Representing structured data for a recipe', '', '550')}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Các thuộc tính toàn cục khác](/en-US/docs/Web/HTML/Reference/Global_attributes)
- Các thuộc tính toàn cục liên quan đến microdata khác:
  - [`itemid`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemid)
  - [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop)
  - [`itemref`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemref)
  - [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype)
