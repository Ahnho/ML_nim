---
fontfamily: "libertine"
mainfont: "GFS Artemisa"
title: "Template"
author: [Sang Ho Ahn]
date: 2018-07-24
subject: "Markdown"
keywords: [Markdown, Example]
subtitle: "Should modify this"
titlepage: true
...


\newpage\null\thispagestyle{empty}\newpage

# LaTex Syntax

## code

```python
def f(x):
return x+1
```

## Table

 this | is | Header
 :--: | :--: | :--: 
 a | b | c\hspace{3cm}

 ## Equation

 ### Inline 

 Qudratic funtion is given
as $f(x) = ax^2 + bx +c $

### paragraph

$$f(x) = ax^2 +bx + c $$



\newpage
#### or pagebreak


### Multiline

**1. Align**

\begin{align*}
    f(x) & = ax^2 + bx +c \\
    & = ax^2 + bx +c
\end{align*}

**2. Gather**

\begin{gather}
    f(x) = ax^2 + bx +c \\
    g(x) = ax^2 + bx +c
\end{gather}

### superscript & subscript

**1.Super Script**

$$e^x,~e^{x^2}$$

**2.SubScript**

$$ a_n = 2a_{n-1} + 1 $$

**3.Mixed**

$$ \delta^\alpha_\beta $$

2 ) Tensor

$$ \tensor[_n]{C}{_r}$$

\newpage---
fontfamily: "libertine"
mainfont: "GFS Artemisa"
title: "Template"
author: [Sang Ho Ahn]
date: 2018-07-24
subject: "Markdown"
keywords: [Markdown, Example]
subtitle: "Should modify this"
titlepage: true
...


\newpage\null\thispagestyle{empty}\newpage

# LaTex Syntax

## code

```python
def f(x):
return x+1
```

## Table

 this | is | Header
 :--: | :--: | :--: 
 a | b | c\hspace{3cm}

 ## Equation

 ### Inline 

 Qudratic funtion is given
as $f(x) = ax^2 + bx +c $

### paragraph

$$f(x) = ax^2 +bx + c $$



\newpage
#### or pagebreak


### Multiline

**1. Align**

\begin{align*}
    f(x) & = ax^2 + bx +c \\
    & = ax^2 + bx +c
\end{align*}

**2. Gather**

\begin{gather}
    f(x) = ax^2 + bx +c \\
    g(x) = ax^2 + bx +c
\end{gather}

### superscript & subscript

**1.Super Script**

$$e^x,~e^{x^2}$$

**2.SubScript**

$$ a_n = 2a_{n-1} + 1 $$

**3.Mixed**

$$ \delta^\alpha_\beta $$

2 ) Tensor

$$ \tensor[_n]{C}{_r}$$

\newpage


### Fraction 

1) Fraction

$$ \frac{1}{2}$$

$$ x = \frac{-b \pm \sqrt{b^2 -4ac}}{2a}$$

2) Differentiation

$$ \frac{df(x)}{dx}$$

$$ \frac{\partial f(X)}{\partial x}$$

$$\PD{f(x)}{x}$$

### Matrix

$$
A =
\begin{pmatrix}
    a & b \\
    c & d
\end{pmatrix}
$$

\newpage

### integration

$$ \int_0^\infty f(x) dx$$

### summation

$$\sum_{n=1}^\infty a_n$$

### Limitation

$$ \lim_{n \rightarrow \infty}
a_n$$

### paremthesis 

1) small

$$(1+ \frac{1}{2})$$

$$\left(1+ \frac{1}{2}
\right)$$

2)middle

$$\{1+ 2\}$$

$$\left\{1+ \frac{1}{2}\right\}$$

## Rimann sum

$$ \int_a^b f(x)dx = \lim_{n \rightarrow \infty}\sum_{k=1}^n f\left(a+ \frac{b-a}{n}k
\right)\frac{b-a}{n} $$

\newpage

## Own template

### parenthesis (Bracket)

1)Small

$$\Sbk{1+ \frac{1}{2}}$$

2) middle

$$ \Mbk{1+ \frac{1}{2}}$$

3) Big
$$\Bbk{1+ \frac{1}{2}}$$

## Ligatures

### 1. Mathcal
$$L$$
$$\mathcal{L}$$

### 2. Mathbb

$$R$$
$$\mathbb{R}~\mathbb{N}~\mathbb{Z}~\mathbb{Q}~\mathbb{C}$$

\newpage



## Tcolor box

\begin{tcolorbox}[colback=white!5!white,colframe=black!30!blue, title=\textbf{HW 1 \hs LaTeX}]
    Hi, Hello
\end{tcolorbox}

\newpage

## Practice

3. 두집합 $A = {(x,y)\,|\,(x-1)^2 + y^2 \leq 4},~ B = {(x,y)\,|\,|(x-1) + |y| \leq a}$에 대하여 $A\subset B$이기 위한 양수 $a$의최소값은?


### Fraction 

1) Fraction

$$ \frac{1}{2}$$

$$ x = \frac{-b \pm \sqrt{b^2 -4ac}}{2a}$$

2) Differentiation

$$ \frac{df(x)}{dx}$$

$$ \frac{\partial f(X)}{\partial x}$$

$$\PD{f(x)}{x}$$

### Matrix

$$
A =
\begin{pmatrix}
    a & b \\
    c & d
\end{pmatrix}
$$

\newpage

### integration

$$ \int_0^\infty f(x) dx$$

### summation

$$\sum_{n=1}^\infty a_n$$

### Limitation

$$ \lim_{n \rightarrow \infty}
a_n$$

### paremthesis 

1) small

$$(1+ \frac{1}{2})$$

$$\left(1+ \frac{1}{2}
\right)$$

2)middle

$$\{1+ 2\}$$

$$\left\{1+ \frac{1}{2}\right\}$$

## Rimann sum

$$ \int_a^b f(x)dx = \lim_{n \rightarrow \infty}\sum_{k=1}^n f\left(a+ \frac{b-a}{n}k
\right)\frac{b-a}{n} $$

\newpage

## Own template

### parenthesis (Bracket)

1)Small

$$\Sbk{1+ \frac{1}{2}}$$

2) middle

$$ \Mbk{1+ \frac{1}{2}}$$

3) Big
$$\Bbk{1+ \frac{1}{2}}$$

## Ligatures

### 1. Mathcal
$$L$$
$$\mathcal{L}$$

### 2. Mathbb

$$R$$
$$\mathbb{R}~\mathbb{N}~\mathbb{Z}~\mathbb{Q}~\mathbb{C}$$

\newpage



## Tcolor box

\begin{tcolorbox}[colback=white!5!white,colframe=black!30!blue, title=\textbf{HW 1 \hs LaTeX}]
    Hi, Hello
\end{tcolorbox}

\newpage

## Practice

3. 두집합 $A = {(x,y)\,|\,(x-1)^2 + y^2 \leq 4},~ B = {(x,y)\,|\,|(x-1) + |y| \leq a}$에 대하여 $A\subset B$이기 위한 양수 $a$의최소값은?