# TASK.md

Project:
Financial Project Planning UI

## Objective

Build a Flutter UI based on the provided screenshot.

The screen is a Vietnamese financial planning dashboard for project/business budget planning.

Main title:

LẬP KẾ HOẠCH TÀI CHÍNH DỰ ÁN

---

## Required Screens

Create one main screen:

ProjectPlanningScreen

The screen should contain:

1. Header
2. Project Type Dropdown
3. Budget Summary Card
4. Cost Category List
5. Budget Distribution Chart
6. CAFE Model Chart
7. Bottom Navigation Bar
8. Floating Add Button

---

## UI Theme

Use dark mode style.

Colors:

- Background: dark teal / black gradient
- Card background: #1F2E2F or similar
- Primary accent: teal / cyan
- Text: white
- Secondary text: light gray
- Error/Warning accent: orange, red, green, yellow

---

## Header

Display:

LẬP KẾ HOẠCH TÀI CHÍNH DỰ ÁN

Style:

- Bold
- White text
- Top aligned
- SafeArea padding

---

## Project Type Dropdown

Label:

LOẠI DỰ ÁN

Options:

- Mô hình Cafe
- Startup Công nghệ
- Kinh doanh Bán lẻ

Selected value:

Mô hình Cafe

The dropdown should use:

- Dark background
- Teal border
- Rounded corners

---

## Budget Summary Card

Display:

2.500.000.000 VNĐ

Also show:

- TextField placeholder: Ngân input
- Small input/button style area
- Slider-like teal line if possible

Card style:

- Rounded corners
- Dark card
- Soft shadow

---

## Cost Categories

Section title:

HẠNG MỤC CHI PHÍ

Create list items:

1. Thuê Mặt Bằng
   Estimated 500.000.000 đ
   Status: Trau họe

2. Thiết Kế & Thi công
   Estimated 1.000.000.000 đ
   Status: Thiur nhân

3. Thiết Bị & Máy Móc
   Estimated 1.000.000.000 đ
   Status: Yải trục

4. Nguyên liệu đầu vào
   Estimated 12.000.000 đ

5. Marketing & Khai trương
   Estimated 97.500.000 đ

Each item should have:

- Icon
- Title
- Estimated amount
- Status text
- Colored left border
- More icon

---

## Budget Distribution Chart

Section title:

BIỂU ĐỒ PHÂN BỔ NGÂN SÁCH

Create a donut/pie chart-like UI.

Because no package should be used, simulate chart with:

- CustomPaint

or use simplified circular chart UI.

Chart title:

PHÂN BỔ THỰC TẾ

Legend:

- Thi công: 35%
- Thiết bị: 25%
- Mặt bằng: 15%
- Nguyên liệu: 15%
- Marketing: 10%

Footer:

TỔNG CHI: 2.380.000.000 VNĐ

---

## CAFE Model Chart

Section title:

BIỂU ĐỒ CHUẨN MÔ HÌNH CAFE

Chart title:

MÔ HÌNH CHUẨN

Legend:

- Mặt bằng: 20%
- Thi công: 30%
- Thiết bị: 20%
- Nguyên liệu: 15%
- Marketing: 10%

Use same donut chart style.

---

## Bottom Navigation

Items:

1. Trang chủ
2. Dự án
3. Báo cáo
4. Tài khoản

Selected item:

Dự án

Style:

- Dark translucent bar
- Teal highlight for selected item

---

## Floating Action Button

Position:

Bottom right

Icon:

+

Color:

Teal

---

## Responsiveness

On phone width:

- Use vertical scrolling
- Sections stacked from top to bottom

On tablet/wide width:

- Use responsive layout if possible:
    - Budget card and charts can appear in grid/row layout

---

## Technical Constraints

- Flutter only
- Dart only
- Prefer no external packages
- Use static sample data
- No API
- No database
- Must compile

---

## Acceptance Criteria

✓ Main UI matches screenshot style

✓ Vietnamese labels

✓ Dark financial dashboard theme

✓ Dropdown works

✓ Category cards display correctly

✓ Donut chart-like UI appears

✓ Bottom navigation visible

✓ Floating add button visible

✓ Responsive scrolling

✓ No compile errors