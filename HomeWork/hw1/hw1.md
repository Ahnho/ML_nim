---
fontfamily: "libertine"
mainfont: "GFS Artemisa"
title: "Home_Work_1"
author: [Sang Ho Ahn]
date: 2018-11-22
subject: "Markdown"
keywords: [Markdown, Example]
subtitle: "Should modify this"
titlepage: true
...


\newpage\null\thispagestyle{empty}\newpage

## \\ 1.7 $$ \mathbb{N}(x|m,\sigma^2) = \frac{1}{(2\pi\sigma^2)^ \frac{1}{2}} \exp(-\frac{1}{2\sigma^2}(x - m)^2) $$  show

## def
\begin{align*}
    I = \int_{-\infty}^\infty \exp(-frac{1}{2\sigma^2}x^2dx) \\
    I^2 = \int_{-\infty}^\infty\int_{-\infty}^\infty \exp(-frac{1}{2\sigma^2}x^2 - -frac{1}{2\sigma^2}y^2)dxdy\\
    x^2 + y^2 = r^2   \frac{\partial(x,y)}{\partial(r,\theta)}\\
\end{align*}
\begin{align*}
    I^2 & = \int_{-\infty}^\infty\int_{-\infty}^\infty \exp(-\frac{r^2}{2\sigma^2})rdrd\theta ..(r^2 = u)\\
    & = 2\pi\int_0^\infty\exp(-\frac{u}{2\sigma^2})\frac{1}{2}du\\
    & = \pi[\exp(-\frac{u}{2\sigma^2})(-2\sigma^2)]_0^\infty\\
    & = 2\pi\sigma^2 \Rightarrow I = (2\pi\sigma^2)^\frac{1}{2}
\end{align*}
\begin{align*}
    \rightarrow \int_{-\infty}^\infty\mathbb{N}(x|m,\sigma^2)dx = \frac{1}{(2\pi\sigma^2)^\frac{1}{2}} \int_{-infty}^\infty \exp(-\frac{y^2}{2\sigma^2})dy = \frac{I}{2\pi\sigma^2}^frac{1}{2} = 1
\end{align*}


## \\ 1.10 $$ E[x + z] = E[x] + E[z] $$ show

## def

\begin{align*}
    E[x + z] & = \int_{-\infty}^\infty\int_{-\infty}^\infty(x+z)f(x+z)dxdy \\
    & = \int_{-\infty}^\infty\int_{-\infty}^\infty x f(x+z)dzdx + \int_{-\infty}^\infty\int_{-\infty}^\infty z f(x+z)dxdz \\
    & = \int_{-\infty}^\infty xf(x)dx + \int_{-\infty}^\infty zf(z)dz
\end{align*}

## \\ 1.10-2 $$ Var[x+z] = Var[x] + Var[z]

## def

\begin{align*}
    Var[x+z] & = E[(x+z)^2] - (E[(x+z)])^2\\
    & = E[x^2] -(E[x])^2  + E[z^2] - (E[z])^2 + 2E[xz] - 2E[x]E[z] .. Cov(x,z) = 2E[xz] = 2E[x]E[z]\\
    & = Var[x] + Var[z]
\end{align*}

\newpage

## \\ 1.12 $$ E[m_{ML}] = \frac{1}{N}\sum_{n=1}^N E[x_n] = m $$

\begin{align*}
    E(\sigma^2_{ML}) & = E\Bbk{\frac{1}{N}\sum_{n=1}^N(x_n - \frac{1}{N}\sum_{m=1}^N x_m)^2]} \\
    & = \frac{1}{N}\sum_{n=1}^N E[x_{n}^2 - \frac{2}{N}x_m\sum_{m=1}^N x_m + \frac{1}{N^2}\sum_{m=1}^2\sum_{l=1}^N x_m x_l]\\
    & = {m^2 + \sigma^2 - 2(m^2 + \frac{1}{N}\sigma^2) + m^2 + \frac{1}{N}\sigma^2} \\
    & = (\frac{N-1}{N})\sigma^2
\end{align*}



