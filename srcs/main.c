/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rreedy <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/07/11 17:34:47 by rreedy            #+#    #+#             */
/*   Updated: 2019/07/17 20:01:33 by rreedy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "config.h"
#include "fdf.h"
#include "ft_put.h"
#include "mlx.h"

int		print_key(int key, void *param)
{
	t_identifiers	*id;

	(void)key;
	id = (t_identifiers *)param;
	mlx_pixel_put(id->connection, id->window, 0, 0, 0x0990000);
	ft_putchar('x');
	return (0);
}

int		main()
{
	t_identifiers	id;

	id.connection = mlx_init();
	if (!id.connection)
		return (0);
	id.window = mlx_new_window(id.connection, SIZE_X, SIZE_Y, TITLE);
	if (!id.window)
		return (0);
	mlx_key_hook(id.window, print_key, (void *)&id);
	mlx_loop(id.connection);
	return (0);
}
