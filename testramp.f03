program testramp

    use cublas
    use ramp

    implicit none

    integer, parameter  :: N = 20000
    real, device        :: x(N)
    integer             :: i

    twopi = atan(1.0) * 8

    call buildramp<<<(N - 1) / 512 + 1, 512>>>(x, N)
    !$cuf kernel do
    do i = 1, N
        x(i) = 2.0 * x(i) * x(i)
    enddo
    print *, "float(N) = ", sasum(N, x, 1)

end program testramp
