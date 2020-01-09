/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rreedy <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/07/11 17:34:47 by rreedy            #+#    #+#             */
/*   Updated: 2020/01/09 04:26:21 by rreedy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "config.h"
#include "fdf.h"
#include "ft_put.h"
#include "mlx.h"

/*
**	Test function for pixel drawing.
**
**	mlx_pixel_put()
**		draws a single pixel on the window given XY coordinates and an RGBA
**		code.
**	
**
**	static int		print_key(int key, void *param)
**	{
**		struct s_idenfifiers	*ids;
**	
**		(void)key;
**		ids = (struct s_identifiers *)param;
**		mlx_pixel_put(ids->connection, ids->window, 0, 0, 0x0990000);
**		ft_putchar('x');
**		return (0);
**	}
*/

/*
**	mlx_init()
**		creates a connection between the software and display.
**	mlx_new_window()
**		draws a window of desired size and title.
**		SIZE_X, SIZE_Y, TITLE macros defined -> ./includes/config.h
**	mlx_key_hook()
**		binds functions to keyboard keys.
**	mlx_loop()
**		loops continuously waiting for events like keyboard and mouse input.
**	handle_key_code()
**		calls a jump table with keys code given keyboard input.
*/

static int	main()
{
	struct s_identifiers	ids;

	ids.connection = mlx_init();
	if (!ids.connection)
		return (0);
	ids.window = mlx_new_window(ids.connection, SIZE_X, SIZE_Y, TITLE);
	if (!ids.window)
		return (0);
	mlx_key_hook(ids.window, handle_key, (void *)&ids);
	mlx_loop(ids.connection);
	return (0);
}
