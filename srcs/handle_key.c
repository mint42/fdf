/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   handle_key.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rreedy <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/09 04:26:07 by rreedy            #+#    #+#             */
/*   Updated: 2020/01/09 04:32:28 by rreedy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static int	execute_event(int32_t index, struct s_identifiers *ids)
{
	static int		(*event_table[TOTAL_EVENTS])() = {
		event_left,
		event_down,
		event_up,
		event_right,
		event_quit,
		event_help_mode,
	};

	return (event_table[index](ids));
}

static int	get_key_code(int key)
{
	static const uint64_t	key_codes[TOTAL_EVENTS] = {
		K_LEFT,
		K_DOWN,
		K_UP,
		K_RIGHT,
		K_QUIT,
		K_HELP,
	};

	i = 0;
	while (i < TOTAL_KEY_CODES)
	{
		if (key_codes[i] == key)
			return (i);
		++i;
	}
	return (-1);
}

int			handle_key(int key, void *param)
{
	struct s_idenfifiers	*ids;
	int32_t					index;

	ids = (struct s_identifiers *)param;
	index = get_key_code(key);
	if (index > -1)
	{
		if (execute_event(index, ids) == ERROR)
			return (ERROR);
	}
	return (SUCCESS);
}
